# Ghidra scripts

Here are some scripts I used to reverse-engineer the game:
 - [PacketTableDump.py](https://github.com/sepalani/MHTrIDA/blob/master/ghidra/scripts/PacketTableDump.py), extract the packet table _(doesn't require Ghidra)_
 - [PacketTableUtils](https://github.com/sepalani/MHTrIDA/blob/master/ghidra/scripts/PacketTableUtils.py), utils I used to extract packet table properties _(doesn't require Ghidra)_
 - [CommentPatSend.py](https://github.com/sepalani/MHTrIDA/blob/master/ghidra/scripts/CommentPatSend.py), try to find functions sending packets to the server

I plan to write at some point a ghidra script to find PAT functions automatically from Ghidra based on the packet table and existing debug strings.
