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
call **getOpeningDNSErrorCode()** or **getNetworkTCPErrorCode()**.



Return Value
------------
Returns **getOpeningDNSErrorCode()**, **getNetworkTCPErrorCode()** error codes
or one of these:
 * 11612
 * 11619
