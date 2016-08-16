# ssl_write



Synopsis
--------
```C++
int ssl_write(int ssl_context, void* buffer, unsigned int length);
```



Address
-------
 * __RMHJ08:__ 0x804cd664
 * __RMHE08:__ 0x8051bd98
 * __RMHP08:__ 0x8051c418



Description
-----------
Tries to write length bytes from the specified ssl_context into the buffer.



Return Value
------------
Returns the size of the data written or an error value.
