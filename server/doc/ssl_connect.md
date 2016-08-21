# ssl_connect



Synopsis
--------
```C++
int ssl_connect(int ssl_context, int socket_fd);
```



Address
-------
 * __RMHJ08:__ 0x804cd220
 * __RMHE08:__ 0x8051b954
 * __RMHP08:__ 0x8051bfd4



Description
-----------
Initializes a SSL connection with a connected socket with
specified *ssl_context* and *socket_fd* values.



Return Value
------------
Returns zero on success or an error value.
