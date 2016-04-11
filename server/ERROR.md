# Error

The purpose of this document is to show from the function perspective how
errors happen. It will detail what has been modified and from which
function. The main goal is to dectect functions which are able to impact
error code value.


## NetworkError structure
### Description
 * 0x0000 - _address?_
 * 0x0004 - _percent?_
 * 0x0008 - _error?_

### Used in
 * [getOpeningErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningErrorCode.md)
 * [getOpeningDNSErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningDNSErrorCode.md)
 * [getOpeningSSLErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningSSLErrorCode.md)
 * [getNetworkErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkErrorCode.md)
 * [getNetworkTCPErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkTCPErrorCode.md)
 * [set_open_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_open_error_code.md)
 * [set_layer_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_layer_error_code.md)
 * [set_ec_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_ec_error_code.md)
 * [set_patch_error_code](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/set_patch_error_code.md)


## [MH3GetSessionErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/MH3GetSessionErrorCode.md)
### Description
This function is based on data located:
 * __Name:__ data, data', data'1, data'2, data'3
 * __RMHJ08:__ -0x4298 (r13), data + 320, 0x0000 (data'), 0x0004 (data'), 0x0008 (data')
 * __RMHE08:__ -0x4128 (r13), data + 320, 0x0000 (data'), 0x0004 (data'), 0x0008 (data')
 * __RMHP08:__ -0x4038 (r13), data + 320, 0x0000 (data'), 0x0004 (data'), 0x0008 (data')

### Error Codes
#### 11620
 * Occurs when data'1 equals 0x8000000A.

#### 11621
 * TODO

#### 11622
 * TODO

#### 11623
 * TODO

#### 11624
 * Occurs when data'1 equals 0x80020001.

#### 11625
 * Occurs when data equals -320 or data'1 equals 0x80000008.

#### 11630
 * TODO

#### 11631
 * TODO

#### 11632
 * TODO

#### 11633
 * TODO

#### 11634
 * TODO

#### 11635
 * Occurs when data'1 equals 0x80030038.

#### 11640
 * TODO

#### 11641
 * TODO

#### 11642
 * TODO

#### 11643
 * TODO

#### 11644
 * TODO

#### 11650
 * TODO

#### 11651
 * TODO

#### 11660
 * TODO

#### 11661
 * TODO

#### 11662
 * Occurs when data'1 equals 0x80030033.

#### 11663
 * TODO

#### 11664
 * TODO

#### 11665
 * TODO

#### 11666
 * TODO

#### 11667
 * TODO

#### 11668
 * TODO

#### 11669
 * TODO

#### 11670
 * TODO

#### 11671
 * TODO

#### 11672
 * TODO

#### 11673
 * TODO

#### 11674
 * TODO

#### 11675
 * TODO

#### 11676
 * TODO

#### 11677
 * TODO

#### 11678
 * TODO

#### 11679
 * TODO


## [getOpeningErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningErrorCode.md)
### Description
This function is based on data located in the **NetworkError** structure passed as pointer parameter in **r3**:
 * __RMHJ08:__ 0x0004 (r3), 0x0008 (r3)
 * __RMHE08:__ 0x0004 (r3), 0x0008 (r3)
 * __RMHP08:__ 0x0004 (r3), 0x0008 (r3)

### Error Codes
#### 11612
 * Occurs when **NetworkError** is null.

#### 11617 (NTSC-J only)
 * TODO

#### 11619 (NTSC-U & PAL only)
 * TODO

#### 11699 (NTSC-U & PAL only)
 * TODO


## [getOpeningDNSErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningDNSErrorCode.md)
### Description
This function is based on data located in the **NetworkError** structure passed as pointer parameter in **r3**:
 * __RMHJ08:__ 0x0008 (r3)
 * __RMHE08:__ 0x0008 (r3)
 * __RMHP08:__ 0x0008 (r3)

### Error Codes
#### 11601
 * Occurs when data equals -305.

#### 11612 (NTSC-J only)
 * Occurs when data doesn't equal -305.

#### 11617 (NTSC-U & PAL only)
 * Occurs when data doesn't equal -305.


## [getOpeningSSLErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getOpeningSSLErrorCode.md)
### Description
This function is based on data located in the **NetworkError** structure passed as pointer parameter in **r3**:
 * __Name:__ data1, data2
 * __RMHJ08:__ 0x0004 (r3), 0x0008 (r3)
 * __RMHE08:__ 0x0004 (r3), 0x0008 (r3)
 * __RMHP08:__ 0x0004 (r3), 0x0008 (r3)

### Error Codes
#### 11602
 * TODO

#### 11603
 * TODO

#### 11604
 * TODO

#### 11605
 * TODO

#### 11606
 * TODO

#### 11607
 * TODO

#### 11608
 * TODO

#### 11618 (NTSC-U & PAL only)
 * TODO

#### 11613
 * TODO

#### 11609
 * Occurs when data2 equals -1

#### 11610
 * TODO

#### 11611
 * TODO

#### 11612
 * TODO


## [getNetworkTCPErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkTCPErrorCode.md)
### Description
This function is based on data located in the **NetworkError** structure passed as pointer parameter in **r3**:
 * __Name:__ data1, data2
 * __RMHJ08:__ 0x0004 (r3), 0x0008 (r3)
 * __RMHE08:__ 0x0004 (r3), 0x0008 (r3)
 * __RMHP08:__ 0x0004 (r3), 0x0008 (r3)

### Error Codes
#### 11612
 * TODO

#### 11613
 * TODO

#### 11614
 * Occurs when data2 equals -15.

#### 11615
 * Occurs when data2 equals -76.

#### 11616
 * Occurs when data2 equals 0.
