# __lwz*



Synopsis
--------
```C++
int __lwz(void*);
```



Address
-------
 * __RMHJ08:__ N/A
 * __RMHE08:__ 0x80478290
 * __RMHP08:__ 0x80478910



Description
-----------
Equivalent to:
```ASM
lwz r3, 0 (r3)
blr
```



Return Value
------------
Returns a word of data from a specified location in memory.



\* Function's name is arbitrary
