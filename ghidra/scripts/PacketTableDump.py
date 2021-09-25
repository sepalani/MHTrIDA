#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""Packet table dump script.

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

import ctypes
import struct

from collections import namedtuple


class PatCommand(namedtuple("_PatCommand", [
    "packet_id",
    "this_delta", "vtable_offset", "func_data",
    "name",
    "unknown"
])):
    STRUCT = ">6I"
    SIZE = 6 * 4

    # First packet in the table
    PATTERN = bytearray([
        0x60, 0x01, 0x01, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, # 0x10/0x14 - MH3/MHG
    ])


class DolResolver(object):
    """Translate address from DOL."""
    def __init__(self, data):
        offsets = struct.unpack_from(">18I", data)
        addresses = struct.unpack_from(">18I", data, 0x48)
        sizes = struct.unpack_from(">18I", data, 0x90)
        self.ranges = tuple((
            (offsets[i], addresses[i], addresses[i]+sizes[i])
            for i in range(18)
        ))

    def tr(self, addr):
        for dol_offset, section_start, section_end in self.ranges:
            if section_start <= addr < section_end:
                return dol_offset + addr - section_start
        raise AssertionError("Unable to translate 0x{:08x}".format(addr))


class RamResolver(object):
    """Translate address from RAM."""
    def tr(self, addr):
        return addr - 0x80000000


def load_file(path):
    """Load a main.dol or mem1.raw file."""
    with open(path, 'rb') as f:
        data = f.read()
        resolver = RamResolver() \
            if len(data) == 0x1800000 \
            else DolResolver(data)
    return data, resolver


def get_commands(data):
    """Get PAT commands based on PatCommand.PATTERN."""
    pattern = bytes(PatCommand.PATTERN)
    matches = []
    offset = data.find(pattern)
    while offset != -1:
        if (offset % 4) == 0:
            matches.append(offset)
        offset = data.find(pattern, offset+1)

    if len(matches) != 1:
        raise AssertionError("Unable to find PAT commands")

    offset = matches[0]
    commands = []
    while True:
        command = PatCommand(*struct.unpack_from(
            PatCommand.STRUCT, data, offset
        ))
        if command.packet_id == 0:
            break
        commands.append(command)
        offset += PatCommand.SIZE
    return commands


def get_command_name(data, resolver, command):
    """Get PAT command SHIFT-JS name."""
    name_offset = resolver.tr(command.name)
    return ctypes.create_string_buffer(data[name_offset:]).value


def save_file(name, data, resolver, commands):
    """Save commands as CSV."""
    with open(name, "wb") as f:
        f.write(b",".join([
            b"packet id",
            b"this delta", b"vtable offset", b"func data",
            b"name addr", b"unknown",
            b"name\n"
        ]))
        line_format = b"%08x," * 6 + b"%s\n"
        for command in commands:
            name = get_command_name(data, resolver, command).strip()
            f.write(line_format % (command + (name,)))


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        description="Dump PAT commands from Monster Hunter 3"
    )
    parser.add_argument('input', metavar='path',
                        help='main.dol or mem1.raw dump')
    parser.add_argument('output', metavar='output.csv',
                        help='CSV output file')
    args = parser.parse_args()

    data, resolver = load_file(args.input)
    commands = get_commands(data)
    save_file(args.output, data, resolver, commands)
