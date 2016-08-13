# ios_ioctlv



Synopsis
--------
```C++
int ios_ioctlv(int fd, int ioctl, int cnt_in, int cnt_io, ioctlv* argv);
```



Address
-------
 * __RMHJ08:__ 0x804736d0
 * __RMHE08:__ 0x804bcc90
 * __RMHP08:__ 0x804bd310



Description
-----------
Execute ioctl operation on ios fd device.
[See this documentation for further details](http://wiibrew.org/wiki/IOS).
```C++
typedef struct _ioctlv
{
	void* data;
	unsigned int len;
} ioctlv;
```



Return Value
------------
Usually, on success zero is returned. A few requests use the return value as
an output parameter and return a nonnegative value on success.
