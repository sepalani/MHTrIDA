# getNetworkErrorCode



Synopsis
--------
```C++
short getNetworkErrorCode(NetworkError*);
```



Address
-------
 * __RMHJ08:__ 0x80b1ec4c
 * __RMHE08:__ 0x8097df38
 * __RMHP08:__ 0x8097df78



Description
-----------
The **getNetworkErrorCode()** function returns the appropriate Network error
code according to the NetworkError passed as parameter. If necessary, it will
call [getOpeningDNSErrorCode()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningDNSErrorCode.md) or [getNetworkTCPErrorCode()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkTCPErrorCode.md).



Return Value
------------
Returns [getOpeningDNSErrorCode()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningDNSErrorCode.md), [getNetworkTCPErrorCode()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkTCPErrorCode.md) error codes
or one of these:
 * 11612
 * 11619
