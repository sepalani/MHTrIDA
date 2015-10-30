# Documentation

Monster Hunter 3 (~tri) servers documentation contains details about functions
used in the game. It will mainly focus on those called during online play. Of
course, others elements related to online play might be included. This file is
the index between various documents.



RSO Files
=========

RSO FILE STRUCTURE
------------------
```
[RSO Header]
[RSO Sections]
    Section 0 - Empty?
    Section 1 - Assembly
    Section 2 - Constructors
    Section 3 - Destructors
    Section 4 - Constants
    Section 5 - Objects
    Section 6 - BSS
    Section 7 - .dwarf
    Section 8 - .line
    ...
    Section Count
[RSO Relocation Tables]
    Externals
    Internals
```

Additionally, exports functions can appear in those sections and references to imports functions can exist.

RSO HEADER
----------
```
Data Structure: [Size: 88 bytes]
     ### Properties
     - [0x00~0x03] Next RSO Entry
     - [0x04~0x07] Previous RSO Entry
     - [0x08~0x0B] Section Count
     - [0x0C~0x0F] Section Table Offset
     - [0x10~0x13] Name Offset
     - [0x13~0x17] Name Size
     - [0x18~0x1B] Version
     - [0x1C~0x2F] BSS Section Size
     ### Section Properties
     - [0x20] Has Prolog Section
     - [0x21] Has Epilog Section
     - [0x22] Has Unresolved Section
     - [0x23] Has BSS Section
     - [0x24~0x27] Prolog Section Offset
     - [0x28~0x2B] Epilog Section Offset
     - [0x2C~0x2F] Unresolved Section Offset
     ### Relocation Tables
     - [0x30~0x33] Internals Relocation Table Offset
     - [0x34~0x37] Internals Relocation Table Size
     - [0x38~0x3B] Externals Relocation Table Offset
     - [0x3C~0x3F] Externals Relocation Table Size
     ### Exports
     - [0x40~0x43] Exports Offset
     - [0x44~0x47] Exports Size
     - [0x48~0x4B] Exports Name Offset
     ### Imports
     - [0x4C~0x0F] Imports Offset
     - [0x50~0x53] Imports Size
     - [0x53~0x57] Imports Name Offset
     ### NOTES
     - [0x58+] Usually, here is the beginning of the Section Table Offset
```

RSO SECTIONS
------------
```
RSO file is divided into sections.
The sections number is determined in the RSO header.

Each section has its own purpose:
  - [Section 0] Empty
  - [Section 1] Assembly
  - [Section 2] Constructors
  - [Section 3] Destructors
  - [Section 4] Constants
  - [Section 5] Objects
  - [Section 6] BSS
  - [Section 7] .dwarf
  - [Section 8] .line
    
Data Structure: [Size: 8 bytes]
  - [0x00~0x03] Section's offset
  - [0x04~0x07] Section's size
```

RSO EXPORTS
-----------
```
Exports are functions exported from this module.
There are stored in the RSO file itself.
You can also extract its code from the RSO Assembly section. 
    
Data Structure: [Size: 16 bytes]
  - [0x00~0x03] Export's name offset
  - [0x04~0x07] Export's offset
  - [0x08~0x0B] Export's section id
  - [0x0C~0x0F] Unknown

Export's name offset: 
    Refers to the name position in the Exports name table.
    
Export's offset:
    Beginning of the export (ASM Code).
    
Export's section id:
    Section where is stored the export.
    
Unknown:
    Need to be determined...
    
 -> Name Resolution
    Goto Export's name offset + Exports name offset (from the header).
    
 -> Extract Content (ASM Code)
    Goto Export's offset + Section id offset.
    
 -> Retrieve Relocations
    Grab the Internals Relocation Entries with r_info (section id) and r_addend
    matching the Export's section id and offset.
```

RSO IMPORTS
-----------
```
Imports are functions imported from another module.
Static RSO files (i.e. not linked) can't retrieve them. 
    
Data Structure: [Size: 12 bytes]
  - [0x00~0x03] Import's name offset
  - [0x04~0x07] Import's offset
  - [0x08~0x0B] Import's entry offset
    
Import's name offset: 
    Refers to the name position in the Imports name table.
    
Import's offset:
    Beginning of the import (ASM Code).
    
Import's entry offset:
    Externals Relocation Table entry address.
    
 -> Name Resolution
    Goto Import's name offset + Imports name offset (from the header).
    
 -> Extract Content (ASM Code)
    Goto Import's offset (need to be linked).
    
 -> Retrieve Relocations
    Goto Externals Relocation Table offset + Import's entry offset.
     -- OR (the following method need to be approved/checked)
    Grab the Externals Relocation Entries with r_info (section id) matching the
    import id.
```

RSO RELOCATION ENTRY (FROM RELOCATION TABLE)
--------------------------------------------
```
Data Structure: [Size: 12 bytes]
  - [0x00~0x03] r_offset
  - [0x04~0x07] r_info
  - [0x08~0x0B] r_addend
    
r_offset:
    Offset where is stored the relocated address.
    
r_info:
    Contains relocation properties.
    The first bytes tell:
     - (Imports) Relocation id
     - (Exports) Section id
     The last bytes indicate the relocation type.
    
r_addend:
    Used for computation purpose (addend).
```



SEL Files
---------
 * TODO



Functions
---------
 * __Error Codes__
   * getOpeningErrorCode
   * getOpeningDNSErrorCode
   * getOpeningSSLErrorCode
   * getNetworkErrorCode
   * getNetworkTCPErrorCode
   * TODO
