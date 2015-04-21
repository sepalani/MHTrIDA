# Save

Checksum
--------
The game uses a checksum to check the save integrity. To compute the checksum you need to add each byte from the address 0x09 to the end of the file.
 * Checksum address: 0x04 [Size: 4 bytes (uint32)]

File Options
------------
 * TODO

Hunter Profile
--------------
 * TODO

Item Box
--------
 * TODO

Equip Box
---------
 * TODO

Day-Night Cycle/Quest Location
------------------------------
Your quests can begin at different places. One single byte sets where you're going (in offline mode), the exact same byte that sets the day-night cycle which takes respectively the value 0 and 1. Unfortunately if the value is above 1 (which should normally never happen) you're going somewhere else allowing you to change the quest location.

Arena Records
-------------
Arena records are stored in a very strange way. Indeed they do not use seconds but something similar to ticks. To convert this time in seconds, you need to divide this value by 30. Of course, online records are saved the exact same way and also save the teamate's name.
