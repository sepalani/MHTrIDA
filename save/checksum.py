#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""Monster Hunter 3 save data checksum calculator.

    Monster Hunter 3 Server Project
    Copyright (C) 2015  Sepalani

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

import struct

CHECKSUM_OFFSET = 4


def check_savefile(path, fix=False):
    with open(path, "rb+") as f:
        data = bytearray(f.read())
        save_checksum, = struct.unpack_from(">I", data, CHECKSUM_OFFSET)
        print("Checksum in save: {:08x}".format(save_checksum))
        computed_checksum = sum(data[CHECKSUM_OFFSET+4:])
        print("Computed checksum: {:08x}".format(computed_checksum))
        if save_checksum == computed_checksum:
            return
        elif fix:
            f.seek(CHECKSUM_OFFSET)
            f.write(struct.pack(">I", computed_checksum))
            print("Checksum fixed!")
        else:
            print("Use -f option to fix the file")


if __name__ == "__main__":
    from argparse import ArgumentParser

    parser = ArgumentParser(description="MH3 save data checksum calculator")
    parser.add_argument("-f", "--fix", action="store_true",
                        help="fix save data checksum")
    parser.add_argument("path", help="path to the save data")
    args = parser.parse_args()
    check_savefile(args.path, args.fix)
