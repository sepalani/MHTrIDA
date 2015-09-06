# Servers
There are two kind of servers in the game. The Nintendo ones, which are used during the login process and sometimes grab some statistics. And the Capcom ones, they're handling most part of the online play such as the Capcom ID selection, the gates, the cities, etc.



Nintendo Servers
----------------
To be honest, we don't need to focus on it too much since current alternative servers handle this task properly. When Capcom servers were originally shutdown, it was Nintendo servers which sent the error code preventing us to go online, not Capcom. Now, all Wii games get this return code and can't go online because of the Gamespy servers shutdown. Using an alternative server like Wiimmfi, returns the correct code and allows the game to connect to Capcom servers. [altwfc](https://github.com/polaris-/dwc_network_server_emulator) also supports this game if you want to setup local alternative Nintendo servers.



Nintendo Certificate
--------------------
It was issued by Nintendo and is present in the game files. This certificate acts as a **Root CA certificate**, any generated certificate having it as a CA will automatically be trusted. **You need to replace it** with your own to make the game trust secure connections with custom servers (_i.e. Capcom and Nintendo ones_).

**Note for Dolphin users:** The emulator doesn't verify the certificate, so this step can be skipped if wanted.

You can find it in the Data4 section of the **main.dol** at these addresses depending of your region:
 * 0x00639EA0, Offset from Data4 section: 0x00011400 [NTSC-J]
 * 0x0056DF80, Offset from Data4 section: 0x00002A20 [NTSC-U]
 * 0x0056E940, Offset from Data4 section: 0x00002C00 [PAL]

By the way, **each version** of the game uses the **same certificate**. The **DER format** is used with **x509v3 extensions**. **OpenSSL** can be used to generate a valid certificate. Then, you can use [MHTriCertPatcher](https://github.com/sepalani/MH3SP/tree/master/cert) to replace the in-game certificate located in MHTri's main.dol with yours.



Capcom Servers
--------------
I don't know how many there are, and how long it will take to reverse them all. You can check the server development progression at this address: https://github.com/sepalani/MH3SP

The first Capcom server listens on port 8200 and waits for a SSL connection. When SSL connection succeeded, it loads up to 85%. Now, we need to figure out what the game wants from the server.



Capcom Certificate
------------------
They're are trusted by the in-game Root CA certificate. Of course, they use a different serial. They might change between servers but it has no importance because they'll be trusted by the game anyway. For the moment, the only one seen uses "_mh.capcom.co.jp_" as **Common Name**. This string is in the **main.dol** as well.

 * Common Name: mh.capcom.co.jp
   * 0x0063A360, Offset from Data4 section: 0x000118C0 [NTSC-J]
   * 0x005FF9B8, Offset from Data5 section: 0x000870B8 [NTSC-U]
   * 0x0060ADC8, Offset from Data5 section: 0x00091CE8 [PAL]


Error Codes
-----------
Here are the MHTri internal error codes, if you want the whole list with Nintendo ones you should check this out: http://forum.wii-homebrew.com/index.php/Thread/51738-Collecting-Error-Codes/

**Server [Port 8200]**
 * Error 11601: Can't get server IP from server's domain name
 * Error 11602: Connection failed / Wrong pass phrase? / Server is running?
 * Error 11603: Connection reset before SSL/TLS negotiation
 * Error 11604: SSL handshake failure [invalid CN]
 * Error 11605: SSL handshake failure [invalid Root CA]
 * Error 11606: SSL handshake failure [invalid Certificate Chain]
 * Error 11607: SSL handshake failure [invalid Date]
 * Error 11609: Connection closed unexpectedly [TCP: RST, ACK]
 * Error 11611: Connection closed by server [TCP: FIN, ACK] + [TCP: RST, ACK]
 * Error 11612: Wrong data sent
 * Error 11613: Timeout while trying to connect
 * Error 11619: Timeout while waiting for data
