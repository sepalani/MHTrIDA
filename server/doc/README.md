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
=========
 * TODO

SECTIONS
--------
```
[Section 0x00] Section 00
    -> Empty
Address: 0x00_00_00_00
Size: 0x00_00_00_00

[Section 0x01] Assembly
    -> main.dol - Text0 Section
Address: 0x80_00_40_00
Size: 0x00_00_00_00

[Section 0x02] Constructors
    -> main.dol - Text1 Section
Address: 0x80_03_F2_60
Size: 0x00_00_00_00

[Section 0x03] Desctructors
    -> Empty?
Address: 0x00_00_00_00
Size: 0x00_00_00_00

[Section 0x04] Constants
    -> Empty?
Address: 0x00_00_00_00
Size: 0x00_00_00_00

[Section 0x05] Object
    -> main.dol - Data4 Section
Address: 0x80_56_FC_40
Size: 0x00_00_00_00

[Section 0x06] BSS
    -> main.dol - Data5 Section
Address: 0x80_57_CF_E0
Size: 0x00_00_00_00

[Section 0x07] Section 07
    ->
Address: 0x80_65_A9_80
Size: 0x00_00_00_00

[Section 0x08] Section 08
    -> main.dol - Data6 Section
Address: 0x80_79_32_E0
Size: 0x00_00_00_00

[Section 0x09] Section 09
    -> main.dol - Data7 Section
Address: 0x80_79_7F_60
Size: 0x00_00_00_00

[Section 0x0A] Section 10
    -> Empty?
Address: 0x00_00_00_00
Size: 0x00_00_00_00

[Section 0x0B] Section 11
    -> 
Address: 0x80_79_6C_20
Size: 0x00_00_00_00

[Section 0x0C] Section 12
    -> Hexspeak: "DEAD BABE"
Address: 0x80_79_FC_A0
Size: 0x00_00_00_00
```



Functions
---------
 * __Entry Points__
   * main
   * TODO
 * __Error Codes__
   * [getOpeningErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningErrorCode.md)
   * [getOpeningDNSErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningDNSErrorCode.md)
   * [getOpeningSSLErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningSSLErrorCode.md)
   * [getNetworkErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkErrorCode.md)
   * [getNetworkTCPErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkTCPErrorCode.md)
   * [set_open_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_open_error_code.md)
   * [set_layer_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_layer_error_code.md)
   * [set_ec_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_ec_error_code.md)
   * [set_patch_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_patch_error_code.md)
   * [check_dopatch_error](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/check_dopatch_error.md)
   * [set_pc_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_pc_error_code.md)
   * [get_network_sub_error_msg](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/get_network_sub_error_msg.md)
   * TODO
 * __Network Functions__
   * [net_connect_init](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/net_connect_init.md)
   * [net_connect_main](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/net_connect_main.md)
   * [_net_spr::operator=](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/_net_spr::operator%3D.md)
   * [net_connect_draw](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/net_connect_draw.md)
   * [net_connect_buffer](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/net_connect_buffer.md)
   * [net_connect_announce](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/net_connect_announce.md)
   * [net_connect_maintenance](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/net_connect_maintenance.md)
   * [net_connect_terms](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/net_connect_terms.md)
   * [online_sub_ec_init](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/online_sub_ec_init.md)
   * [online_sub_ec](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/online_sub_ec.md)
   * [online_sub_reflect_init](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/online_sub_reflect_init.md)
   * [online_sub_reflect](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/online_sub_reflect.md)
   * [online_sub_patch_do_check](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/online_sub_patch_do_check.md)
   * TODO
 * __Display Functions__
   * [disp_net_connect_err](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/disp_net_connect_err.md)
   * [disp_net_connect_plat](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/disp_net_connect_plat.md)
   * [disp_error_string](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/disp_error_string.md)
   * TODO
 * __PatInterface__
   * [setTermsBuffer](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/PatInterface/setTermsBuffer.md)
   * [setMaintenanceBuffer](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/PatInterface/setMaintenanceBuffer.md)
   * [setAnnounceBuffer](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/PatInterface/setAnnounceBuffer.md)
   * [setNoChargeBuffer](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/PatInterface/setNoChargeBuffer.md)
   * [setPatchMessageBuffer](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/PatInterface/setPatchMessageBuffer.md)
   * [mpInstance](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/PatInterface/mpInstance.md)
   * [getInstance](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/PatInterface/getInstance.md)
 * __[sNetworkLibrary](https://github.com/sepalani/MHTrIDA/tree/master/server/doc/sNetworkLibrary)__
   * [getInstance](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/sNetworkLibrary/getInstance.md)
   * [getMediatorInstance](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/sNetworkLibrary/getMediatorInstance.md)
   * [mpInstance](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/sNetworkLibrary/mpInstance.md)
   * [mpMediator](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/sNetworkLibrary/mpMediator.md)
 * __[NetworkWiiMediator](https://github.com/sepalani/MHTrIDA/tree/master/server/doc/NetworkWiiMediator)__
   * [reflectInit](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/reflectInit.md)
   * [reflectStart](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/reflectStart.md)
   * [reflectStop](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/reflectStop.md)
   * [reflectFinal](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/reflectFinal.md)
   * [getOpeningProgress](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getOpeningProgress.md)
   * [getOpeningTermsVersion](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getOpeningTermsVersion.md)
   * [getAccountChargeSddlibTime](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getAccountChargeSddlibTime.md)
   * [isOpeningMaintenanceTerms](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/isOpeningMaintenanceTerms.md)
   * [isOpeningMaintenanceServer](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/isOpeningMaintenanceServer.md)
   * [isOpeningAnnounce](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/isOpeningAnnounce.md)
   * [getAccountBan](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getAccountBan.md)
   * [getAccountNeedToCharge](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getAccountNeedToCharge.md)
   * [getAccountWarning](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getAccountWarning.md)
   * [getAccountWaitQueue](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getAccountWaitQueue.md)
   * [getReflectPage](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getReflectPage.md)
   * [agreeReflect](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/agreeReflect.md)
   * [connectECServer](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/connectECServer.md) __(Japanese version only)__
   * [getECTicketList](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getECTicketList.md) __(Japanese version only)__
   * [purchaseEC](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/purchaseEC.md) __(Japanese version only)__
   * [isECConfig](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/isECConfig.md) __(Japanese version only)__
   * [isECTicket](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/isECTicket.md) __(Japanese version only)__
   * [getECBalance](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getECBalance.md) __(Japanese version only)__
   * [isECPCEnable](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/isECPCEnable.md) __(Japanese version only)__
   * [setECPCPassword](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/setECPCPassword.md) __(Japanese version only)__
   * [launchECShoppingManual](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/launchECShoppingManual.md) __(Japanese version only)__
   * [getECPatch](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/NetworkWiiMediator/getECPatch.md) __(Japanese version only)__
