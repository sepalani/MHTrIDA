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


Farm
----
The farms levels and the box contents can be found at those addresses for the 1st, 2nd and 3rd profiles respectively:

1. **Farms Level**
 * 0x00469C | 0x00A69C | 0x01069C - Herb Level [uint8]
 * 0x00469D | 0x00A69D | 0x01069D - Shroom Level [uint8]
 * 0x00469E | 0x00A69E | 0x01069E - Honey Level [uint8]
 * 0x00469F | 0x00A69F | 0x01069F - Insect Level [uint8]
2. **Slot 1**
 * 0x0046A0 | 0x00A6A0 | 0x0106A0 - Item ID [uint16]
 * 0x0046A2 | 0x00A6A2 | 0x0106A2 - Catalyser ID [uint16]
 * 0x0046A4 | 0x00A6A4 | 0x0106A4 - Days remaining [uint8]
 * 0x0046A5 | 0x00A6A5 | 0x0106A5 - Number of days [uint8]
 * 0x0046A6 | 0x00A6A6 | 0x0106A6 - Reward [uint16]
3. **Slot 2** 
 * 0x0046A8 | 0x00A6A8 | 0x0106A8 - Item ID [uint16]
 * 0x0046AA | 0x00A6AA | 0x0106AA - Catalyser ID [uint16]
 * 0x0046AC | 0x00A6AC | 0x0106AC - Days remaining [uint8]
 * 0x0046AD | 0x00A6AD | 0x0106AD - Number of days [uint8]
 * 0x0046AE | 0x00A6AE | 0x0106AE - Reward [uint16]
4. **Slot 3**
 * 0x0046B0 | 0x00A6B0 | 0x0106B0 - Item ID [uint16]
 * 0x0046B2 | 0x00A6B2 | 0x0106B2 - Catalyser ID [uint16]
 * 0x0046B4 | 0x00A6B4 | 0x0106B4 - Days remaining [uint8]
 * 0x0046B5 | 0x00A6B5 | 0x0106B5 - Number of days [uint8]
 * 0x0046B6 | 0x00A6B6 | 0x0106B6 - Reward [uint16]


Day-Night Cycle/Quest Location
------------------------------
Your quests can begin at different places. One single byte sets where you're going (in offline mode), the exact same byte that sets the day-night cycle which takes respectively the value 0 and 1. Unfortunately if the value is above 1 (which should normally never happen) you're going somewhere else allowing you to change the quest location.


Arena Records
-------------
Arena records are stored in a very strange way. Indeed they do not use seconds but something similar to ticks. To convert this time in seconds, you need to divide this value by 30. Of course, online records are saved the exact same way and also save the teamate's name.
