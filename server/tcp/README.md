# TCP Servers

Here are the technical information about the game servers' behaviors.


Port 8200
---------
The first resquest need at least 8 bytes to end. It's a kind of header for the content the client will read. Here is a basic structure of what is known. The request will end after the data size bytes being sent.

**Header Part**
 * [0x00~0x01] **Data Size** (uint16)
 * [0x02~0x07] ???

**Data Part**
 * [0x08~0x??] Which are N (= **Data Size**) bytes
