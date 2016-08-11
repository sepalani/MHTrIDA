# ssl_read



Synopsis
--------
```C++
int ssl_read(int ssl_context, void* buffer, unsigned int length);
```



Address
-------
 * __RMHJ08:__ 0x804cd394
 * __RMHE08:__ 0x8051bac8
 * __RMHP08:__ 0x8051c148



Description
-----------
Tries to read length bytes from the specified ssl_context into the buffer.



Return Value
------------
Returns the size of the data read or an error value.
