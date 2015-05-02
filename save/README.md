# Save
In the the Monster Hunter Tri save there are 3 kind of files.
 * The network file, which store some network settings like the network assistance code.
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
These profiles seem to be 0x6000 (24.576) bytes each. Supposing that the file options are 0x48 (78) bytes, then profiles are arranged like that:
 * Profile 1 address: 0x0048
 * Profile 2 address: 0x6048
 * Profile 3 address: 0xC048


Hunter Pouches
--------------
In fact, even if there are two kind of pouch: the **Blademaster Pouch** and the **Gunner pouch**, the only difference between them is a matter of size. A pouch is made of **Item Slots** which are a pairs of **Item ID** [uint16] and **Quantity** [int16]. A gunner pouch is **one page** (x8 **Item Slot**) bigger than a blademaster pouch. However this pouch can only contains gunner class items (ammos).
 1. **Item Slot** [Size: 4 bytes]
  * 0x00 - Item ID [uint16]
  * 0x02 - Quantity [int16]
 2. **Pouch Page** [Size: **Item Slot** (x8) | 0x20 (32) bytes]
  * 0x00 - **Item Slot** (x8)
 3. **Blademaster Pouch** [Size: **Pouch Page** (x3) | 0x60 (96) bytes]
  * 0x0000E8 | 0x0060E8 | 0x00C0E8 - First slot
  * 0x000144 | 0x006144 | 0x00C144 - Last slot
 3. **Gunner Pouch** [Size: **Pouch Page** (x4) | 0x80 (128) bytes]
  * 0x000148 | 0x006148 | 0x00C148 - First slot
  * 0x0001C4 | 0x0061C4 | 0x00C1C4 - Last slot


Item Box
--------
Hunters' Item Box is composed of (x800) **Item Slots** which are a pairs of **Item ID** [uint16] and **Quantity** [int16].
 1. **Item Slot** [Size: 4 bytes]
  * 0x00 - Item ID [uint16]
  * 0x02 - Quantity [int16]
 2. **Item Box** [Size: **Item Slot** (x800) | 0xC80 (4800) bytes]
  * 0x0001C8 | 0x0061C8 | 0x00C1C8 - First slot
  * 0x000E44 | 0x006E44 | 0x00CE44 - Last slot

Equip Box
---------
 * TODO


Fishery
-------
Hunting Boats allow you to collect items by sending your fleets on different locations. During the game you'll be able to manage 3 boats, the **Cap'n ship**, the **Black ship** and the **Red ship**.
 1. **Cap'n**
  * 0x003F80 | 0x009F80 | 0x00FF80 - Boat status [uint8]
  * 0x003F81 | 0x009F81 | 0x00FF81 - Fisher's mood [uint8]
  * 0x003F82 | 0x009F82 | 0x00FF82 - Boat Level [uint8]
  * 0x003F83 | 0x009F83 | 0x00FF83 - Destination [uint8]
  * 0x003F84 | 0x009F84 | 0x00FF84 - Days remaining [uint8]
  * 0x003F85 | 0x009F85 | 0x00FF85 - Prefered Destination [uint8]
  * 0x003F86 | 0x009F86 | 0x00FF86 - Tackle [uint16]
  * 0x003F88 | 0x009F88 | 0x00FF88 - Rewards [uint16]
  * 0x003F8A | 0x009F8A | 0x00FF8A - Previous Mood [uint8]
  * 0x003F8B | 0x009F8B | 0x00FF8B - Previous Prefered Destination [uint8]
 2. **Black**
  * 0x003F8C | 0x009F8C | 0x00FF8C - Boat status [uint8]
  * 0x003F8D | 0x009F8D | 0x00FF8D - Fisher's mood [uint8]
  * 0x003F8E | 0x009F8E | 0x00FF8E - Boat Level [uint8]
  * 0x003F8F | 0x009F8F | 0x00FF8F - Destination [uint8]
  * 0x003F90 | 0x009F90 | 0x00FF90 - Days remaining [uint8]
  * 0x003F91 | 0x009F91 | 0x00FF91 - Prefered Destination [uint8]
  * 0x003F92 | 0x009F92 | 0x00FF92 - Bait ID [uint16]
  * 0x003F94 | 0x009F94 | 0x00FF94 - Rewards [uint16]
  * 0x003F96 | 0x009F96 | 0x00FF96 - Previous Mood [uint8]
  * 0x003F97 | 0x009F97 | 0x00FF97 - Previous Prefered Destination [uint8]
 3. **Red**
  * 0x003F98 | 0x009F98 | 0x00FF98 - Boat Status [uint8]
  * 0x003F99 | 0x009F99 | 0x00FF99 - Fisher's mood [uint8]
  * 0x003F9A | 0x009F9A | 0x00FF9A - Boat Level [uint8]
  * 0x003F9B | 0x009F9B | 0x00FF9B - Destination [uint8]
  * 0x003F9C | 0x009F9C | 0x00FF9C - Days remaining [uint8]
  * 0x003F9D | 0x009F9D | 0x00FF9D - Prefered Destination [uint8]
  * 0x003F9E | 0x009F9E | 0x00FF9E - Bait ID [uint16]
  * 0x003FA0 | 0x009FA0 | 0x00FFA0 - Rewards [uint16]
  * 0x003FA2 | 0x009FA2 | 0x00FFA2 - Previous Mood [uint8]
  * 0x003FA3 | 0x009FA3 | 0x00FFA3 - Previous Prefered Destination [uint8]


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
Your quests can begin at different places. One single byte sets where you're going (in offline mode), the exact same byte that sets the **day-night cycle** which takes respectively the value 0 or 1. Unfortunately if the value is above 1 (which should normally never happen) you're going somewhere else allowing you to change the **quest location**.

1. **Cycle value**
  * 0x00 - Day cycle
  * 0x01 - Night cycle
  * 0x?? - Quest location changer
2. **Cycle address**
  * 0x0003E48 | 0x009E48 | 0x00FE48 - **Cycle value** [uint8]


Arena Records
-------------
Arena records are stored in a very strange way. Indeed they do not use seconds but something similar to ticks. To convert this time in seconds, you need to divide this value by 30. Of course, online records are saved the exact same way and also save the teamate's name.
