# Static Analysis
This analysis targets the client-server process on port 8200. Currently the game loads up to 85%. To go further we need to know what the server on port 8200 has to send to the game.

Those maps allow to put names on these addresses which can be functions and data used by the game. I took them while the game was waiting for more inputs from this server (i.e. at 85%) listening on port 8200.



Dolphin Symbol Map
------------------
Generated with Dolphin Emulator in debug mode. May help to understand better functions used by the game. You can use them or generate them yourselves. However keep in mind that the game dynamically loads symbols and doing it at the wrong time will screw up your symbol map.



RSO Symbol Map
--------------
These maps are generated with my RSO Tools. It retrieves symbols from RSO in files or within a RAM dump, then makes a map with them. Since they're are dynamic symbols, they can differ if they're dumped later because the game can (un)load some of them.



Response Buffer Address
-----------------------
When the game sends a request to the server, it stores the server response somewhere in the memory. Knowing where it's stored allow us to know which function may use it. I use Dolphin Emulator to dump the RAM, the RAM address begins at 0x80000000. To find this buffer address, you only need to send a response from the server and track it inside the RAM. Here are the addresses used by the game to store the responses of this server.

**[1st request's response]**
 * Buffer Address: 0x80CD5318, Response Size: 0x80CD5310 [PAL]
 * Buffer Address: 0x80CD5318, Response Size: 0x80CD5310 [NTSC-U]
 * Buffer Address: 0x80CA9400, Response Size: 0x80CA93F8 [NTSC-J]


Error Codes
-----------
After some testing, I was able to figure out the meaning of error codes related to this server.
 * Error 11602: Connection failed / Wrong pass phrase? / Server is running?
 * Error 11609: Connection closed unexpectedly [TCP: RST, ACK]
 * Error 11611: Connection closed by server [TCP: FIN, ACK] + [TCP: RST, ACK]
 * Error 11612: Wrong data sent
 * Error 11619: Timeout
