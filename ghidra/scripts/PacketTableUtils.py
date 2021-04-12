#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""Packet table utils.

    Monster Hunter 3 Server Project
    Copyright (C) 2021  Sepalani

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""

from collections import namedtuple, OrderedDict


class Packet(namedtuple("_Packet", ["id4", "addr", "name"])):
    TYPES = {
        "01": "Req",
        "02": "Ans",
        "10": "Ntc"
    }

    def get_id2(self):
        """Return packet ID2."""
        return self.id4[:4]

    def get_type(self):
        """Return packet type."""
        return self.id4[4:6]

    def get_typename(self):
        """Return packet typename."""
        return self.TYPES.get(self.get_type(), "")

    def get_defaultname(self):
        """Return packet default name."""
        name = self.name
        if not name:
            name = "{}0x{}".format(self.get_typename(), self.get_id2())
        elif name.startswith("recv") or name.startswith("send"):
            name = name[4:]
        return name


class PacketMap(OrderedDict):
    """Map packet table by ID2 and Packet.TYPES."""
    def __init__(self, table):
        OrderedDict.__init__(self)
        for packet in table:
            packet_id2 = packet.get_id2()
            packet_type = packet.get_type()
            self.setdefault(packet_id2, OrderedDict())[packet_type] = (
                packet.addr, packet.name
            )

    def get_table(self):
        """Generate packet table."""
        table = []
        for packet_id2, packet_types in self.items():
            for packet_type, (addr, name) in packet_types.items():
                packet_id4 = packet_id2 + packet_type + '00'
                table.append(Packet(packet_id4, addr, name))
        return table

    def autorename_packet(self, packet_id2, packet_type):
        """Rename packet based on the packet_id2/type and existing names."""
        if packet_type not in Packet.TYPES:
            print("[ERROR] Unknown packet type: {}".format(packet_type))
            return ""

        def strip(name):
            """Strip packet name."""
            if name.startswith("recv") or name.startswith("send"):
                name = name[4:]
            if name[:3] not in Packet.TYPES.values():
                print("[Warning] Unknown packet type for: {}".format(name[:3]))
                return name
            return name[3:]

        candidates = set([
            strip(name) for addr, name in self[packet_id2].values() if name
        ])
        if not candidates:
            print("[Warning] No candidates for {}".format(packet_id2))
            return "{}0x{}".format(Packet.TYPES[packet_type], packet_id2)
        if len(candidates) != 1:
            print("[Warning] Too many candidates for {} with {}".format(
                packet_id2, candidates
            ))
        return "{}{}".format(Packet.TYPES[packet_type], candidates.pop())

    def autorename(self):
        """Rename packets based on existing names."""
        rename_map = PacketMap([])
        for packet_id2, packet_types in self.items():
            for packet_type, (addr, name) in packet_types.items():
                if packet_id2 == '0000' and packet_type == '00':
                    continue
                if not name:
                    name = "recv" if addr != '00000000' else "send"
                    name += self.autorename_packet(packet_id2, packet_type)
                rename_map.setdefault(packet_id2,
                                      OrderedDict())[packet_type] = (
                    addr, name
                )
        return rename_map


def open_table(path):
    """Read a packet table file using the format: PACKET_ID,ADDR,NAME.

    Example:
    60010100,80404394,recvReqLineCheck
    60010200,00000000,
    """
    table = []
    with open(path, 'r') as f:
        for line in f:
            fields = [field.strip() for field in line.strip().split(',')]
            if len(fields) != 3:
                continue
            table.append(Packet(*fields))
    return table


def find_duplicates(table):
    """Find duplicates in packets."""
    rev_map = {}
    for packet in table:
        rev_map.setdefault(packet.name, set()).add(packet)

    duplicates = {
        name: packets
        for name, packets in rev_map.items()
        if len(packets) >= 2
    }
    return duplicates


def dump_ids(table):
    """Dump packet table IDs."""
    dump = []
    for packet in table:
        dump.append("0x{}: {!r}".format(packet.id4, packet.get_defaultname()))
    return dump


def dump_names(table):
    """Dump packet table names."""
    dump = []
    visited = set()
    for packet in table:
        name = packet.get_defaultname()
        for i in range(2, 10):
            if name not in visited:
                break
            name = "{}{}".format(packet.get_defaultname(), i)
        visited.add(name)
        dump.append("{} = 0x{}".format(name, packet.id4))
    return dump


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument("table", nargs=1, metavar="packet_table.csv",
                        help="""PatInterface packet table in CSV format

Example (PACKET_ID,ADDR,NAME):
60010100,80404394,recvReqLineCheck
60010200,00000000,""")
    parser.add_argument("--auto-rename", dest="autorename", nargs=1,
                        metavar="out.csv",
                        help="Rename unknown packets based on existing names")
    parser.add_argument("--show-duplicates", dest="show_duplicates",
                        action="store_true",
                        help="Show duplicated names from the packet table")
    parser.add_argument("--dump-ids", dest="dump_ids",
                        action="store_true",
                        help="Dump packet IDs from the packet table")
    parser.add_argument("--dump-names", dest="dump_names",
                        action="store_true",
                        help="Dump packet names from the packet table")
    args = parser.parse_args()

    table = open_table(args.table[0])

    if args.autorename:
        table = PacketMap(table).autorename().get_table()
        with open(args.autorename[0], "w") as f:
            for packet in table:
                f.write("{},{},{}\n".format(
                        packet.id4, packet.addr, packet.name))

    if args.show_duplicates:
        duplicates = find_duplicates(table)
        if duplicates:
            print("Duplicates found:")
            for name, packets in duplicates.items():
                print("  {}: {}".format(name, ", ".join(
                    "Packet(id4={}, addr={})".format(packet.id4, packet.addr)
                    for packet in packets
                )))

    if args.dump_ids:
        print(",\n".join(dump_ids(table)))

    if args.dump_names:
        print("\n".join(dump_names(table)))
