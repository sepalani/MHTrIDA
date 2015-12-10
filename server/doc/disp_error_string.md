# disp_error_string



Synopsis
--------
```C++
void disp_error_string(long, long);
```



Address
-------
 * __RMHJ08:__ 0x80b1e360
 * __RMHE08:__ 0x8097d938
 * __RMHP08:__ 0x8097d978



Description
-----------
This function displays the error message in the message board, followed by the
error code by respectively calling the [disp_net_connect_err](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/disp_net_connect_err.md)
and the [disp_net_connect_plat](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/disp_net_connect_plat.md) functions.
It takes as parameters the message id, then the error code to display.



Return Value
------------
 * None
