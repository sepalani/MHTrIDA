# __init_registers



Synopsis
--------
```C++
void __init_registers(void);
```



Address
-------
 * __RMHJ08:__ 0x800041a8
 * __RMHE08:__ 0x80006480
 * __RMHP08:__ 0x80006480



Description
-----------
Initialize all registers. Zeroing r0, r3 to r12 and r14 to r31. Assigning valid
pointers to others registers: r1(sp), r2(rtoc) and r13.



Return Value
------------
 * None
