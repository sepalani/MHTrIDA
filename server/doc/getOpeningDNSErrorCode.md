# getOpeningDNSErrorCode



Synopsis
--------
```C++
short getOpeningDNSErrorCode(NetworkError*);
```



Address
-------
 * __RMHJ08:__ 0x80b1eb68
 * __RMHE08:__ 0x8097de58
 * __RMHP08:__ 0x8097de98



Description
-----------
The **getOpeningDNSErrorCode()** function returns the appropriate DNS error
code according to the NetworkError passed as parameter.



Return Value
------------
Returns one the following error codes:
 * 11601
 * 11617



Caller
------
 * [getNetworkErrorCode(NetworkError*)](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkErrorCode.md)
 * [getOpeningErrorCode(NetworkError*)](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningErrorCode.md)
