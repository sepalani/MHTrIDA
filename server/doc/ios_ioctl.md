# ios_ioctl



Synopsis
--------
```C++
int ios_ioctl(int fd, int ioctl, void* buffer_in, int len_in, void* buffer_io, int len_io);
```



Address
-------
 * __RMHJ08:__ 0x80473380
 * __RMHE08:__ 0x804bc930
 * __RMHP08:__ 0x804bcfb0



Description
-----------
Execute ioctl operation on ios fd device.
[See this documentation for further details](http://wiibrew.org/wiki/IOS).



Return Value
------------
Usually, on success zero is returned. A few requests use the return value as
an output parameter and return a nonnegative value on success.
