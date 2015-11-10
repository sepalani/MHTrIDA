# getOpeningErrorCode



Synopsis
--------
```C++
short getOpeningErrorCode(NetworkError*);
```



Address
-------
 * __RMHJ08:__ 0x80b1eaf8
 * __RMHE08:__ 0x8097dde4
 * __RMHP08:__ 0x8097de24



Description
-----------
The **getOpeningErrorCode()** function returns the appropriate Opening error
code according to the NetworkError passed as parameter. If necessary, it will
call [getOpeningDNSErrorCode()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningDNSErrorCode.md) or [getOpeningSSLErrorCode()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningSSLErrorCode.md).



Return Value
------------
Returns [getOpeningDNSErrorCode()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningDNSErrorCode.md), [getOpeningSSLErrorCode()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningSSLErrorCode.md) error codes
or one of these:
 * 11612
 * 11619
