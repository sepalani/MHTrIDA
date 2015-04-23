# Save
In the the Monster Hunter Tri save there are 3 kind of files.
 * The network file which store some network settings, like the network assistance code.
 * The system file, I really don't know what are in there and it isn't a priority as of right now.
 * Then the most interesting part, data files.

These data files are "files" where you can store hunters, all their properties and they also store common option settings for them. This post will more likely detail all the content found in these data files and sometimes how to exploit them.


Checksum
--------
The game uses a checksum to check the save integrity. To compute the checksum you need to add each byte from the address 0x08 (which is the 9th byte) to the end of the file.
 * Checksum address: 0x04 [Size: 4 bytes (uint32)]


File Options
------------
 * TODO


Hunter Profiles
---------------
These profiles seem to be 0x6000 (24.576) bytes each. Supposing that the file options are 0x48 (78) bytes, then profiles are arranges like that:
 * Profile 1 address: 0x0048
 * Profile 2 address: 0x6048
 * Profile 3 address: 0xC048


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
