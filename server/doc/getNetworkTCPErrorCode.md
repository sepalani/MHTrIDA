# getNetworkTCPErrorCode



Synopsis
--------
```C++
short getNetworkTCPErrorCode(NetworkError*);
```



Address
-------
 * __RMHJ08:__ 0x80b1ecac
 * __RMHE08:__ 0x8097df9c
 * __RMHP08:__ 0x8097dfdc



Description
-----------
The **getNetworkTCPErrorCode()** function returns the appropriate TCP error
code according to the NetworkError passed as parameter.



Return Value
------------
Returns one the following error codes:
 * 11612
 * 11613
 * 11614
 * 11615
 * 11616



Caller
------
 * [getNetworkErrorCode(NetworkError*)](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkErrorCode.md)
