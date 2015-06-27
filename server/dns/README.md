# DNS Servers
These are all the known domain names used by the game, it slightly differs between games depending on their region. You may want to redirect them to your server IP in order to test a custom server.



Nintendo Servers
----------------
Nintendo use the internal name of the game for making these domains. They also use a secret and a public name to handle specific requests. Manage these domain names while using a Nintendo servers alternative, is no big deal since you don't have to do anything with Nintendo servers.



GameID6 | Internal Name | Secret | Public Name
----------------------------------------------
European and American versions have the same properties.
```
RMHJ08 | monhunter3wii | mO984l | Monster Hunter 3 (JPN) (Wii)
RMHE08 | mh3uswii | IwkoVF | Monster Hunter 3 (US/EU) (Wii)
RMHP08 | mh3uswii | IwkoVF | Monster Hunter 3 (US/EU) (Wii)
```


Nintendo Domain Names
---------------------
The '%s' stands for the internal name.

You can find the ms calculation here:
http://wiki.tockdom.com/wiki/MKWii_Network_Protocol/Server/GAME.msNUM.gs.nintendowifi.net

You can also try it there: https://ideone.com/VydBSP

 * gpcm.gs.nintendowifi.net
 * gpsp.gs.nintendowifi.net
 * %s.available.gs.nintendowifi.net
 * %s.gamestats.gs.nintendowifi.net
 * %s.gamestats2.gs.nintendowifi.net
 * %s.master.gs.nintendowifi.net
 * mh3uswii.ms1.nintendowifi.net [PAL, NTSC-U]
 * monhunter3wii.ms16.nintendowifi.net [NTSC-J]
 * %s.natneg1.gs.nintendowifi.net
 * %s.natneg2.gs.nintendowifi.net
 * %s.natneg3.gs.nintendowifi.net
 * naswii.nintendowifi.net



Capcom Domain Names
-------------------
Very interesting fact, that the main difference used to distinguish region is the domain name and a number. We could probably get the Capcom NTSC-U/PAL servers working together if they don't differ too much. It seems that the mh.capcom.co.jp is used as Common Name within the game's certificate.

 * mh.capcom.co.jp
 * mmh-t1-opn02.mmh-service.capcom.co.jp [NTSC-J]
 * mmh-t1-opn03.mmh-service.capcom.co.jp [NTSC-U]
 * mmh-t1-opn04.mmh-service.capcom.co.jp [PAL]
