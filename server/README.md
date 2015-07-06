# Servers
There are two kind of server in the game. The Nintendo ones, which are used during the login process and sometimes grab some statistics. And the Capcom ones, they're handling most part of the online play such as the Capcom ID selection, the gates, the city, etc.



Nintendo Servers
----------------
To be honest, we don't need to focus on it too much since current alternative servers handle this task properly. When the Capcom servers were originally shutdown, it was the Nintendo servers which sent the error code preventing us to go online, not Capcom. Now, all the Wii games get this return code and can't go online because of the Gamespy servers shutdown. Using an alternative server like Wiimmfi, returns the correct code and allows the game to connect to Capcom servers.



Nintendo Certificate
--------------------
We don't have to deal with it, thanks to the alternative servers. ~~As far as I know, the only certificate in the game is the Nintendo one. In other word, the game doesn't check the Capcom certificate.~~ However if you still want to mess with Nintendo certificate, you can find it in the Data4 section of the main.dol at these addresses depending of your region:
 * 0x00639EA0, Offset from Data4 section: 0x00011400 [NTSC-J]
 * 0x0056DF80, Offset from Data4 section: 0x00002A20 [NTSC-U]
 * 0x0056E940, Offset from Data4 section: 0x00002C00 [PAL]

**EDIT:** It seems that **Dolphin Emulator** trust unknown certificates when the **Wii doesn't**. Good to know. So working on untrusted servers is doable via Dolphin Emulator.

By the way, **each version** of the game uses the **same certificate**. The **DER format** is used with **x509v3 extensions**. Patching the game allows a given certificate to be trusted. Useless if you use Dolphin for the moment, may be useful for Wii users.

**OpenSSL** can be used to generate a valid certificate. An automated tool is planned for the custom certificate generation and game patching according to the game region.



Capcom Servers
--------------
I don't know how many there are, and how long it will take to reverse them all. You can check the server development progression at this address: https://github.com/sepalani/MH3SP

The first Capcom server listens on port 8200 and waits for a SSL connection. If the SSL connection succeeded, it loads up to 85%. Now, we need to figure out what the game wants from the server.



Capcom Certificate
------------------
Using Dolphin I was able to find what certificate is send to the server. It seems created on the fly or to be somewhere I didn't see yet. Details of Capcom certificate:
 * Common Name: mh.capcom.co.jp
   * 0x0063A360, Offset from Data4 section: 0x000118C0 [NTSC-J]
   * 0x005FF9B8, Offset from Data5 section: 0x000870B8 [NTSC-U]
   * 0x0060ADC8, Offset from Data5 section: 0x00091CE8 [PAL]
 * TODO...



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
