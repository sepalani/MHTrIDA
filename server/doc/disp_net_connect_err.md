# disp_net_connect_err



Synopsis
--------
```C++
void disp_net_connect_err(unsigned char);
```



Address
-------
 * __RMHJ08:__ 0x80b1dcf8
 * __RMHE08:__ 0x8097d1ec
 * __RMHP08:__ 0x8097d22c



Description
-----------
This functions displays the main message in message board and its buttons.
It takes as parameter, the message id to display. The message can be found
into the **net_data.rso** file and changes according to the language. It will
be converted into Shift-JIS or Unicode.



Return Value
------------
 * None
