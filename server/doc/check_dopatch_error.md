# check_dopatch_error



Synopsis
--------
```C++
int check_dopatch_error(int);
```



Address
-------
 * __RMHJ08:__ 0x80b1f070
 * __RMHE08:__ 0x8097e304
 * __RMHP08:__ 0x8097e344



Description
-----------
This function seems to be an inner function of [set_ec_error_code()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_ec_error_code.md).
So, it starts a few bytes farther and thus doesn't perform some actions.
This one is also after [set_patch_error_code()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_patch_error_code.md) and takes as parameter the [disp_error_string()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/disp_error_string.md) return value.




Return Value
------------
Returns [set_ec_error_code()](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_ec_error_code.md) values.
