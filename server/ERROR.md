# Error

The purpose of this document is to show from the function perspective how
errors happen. It will detail what has been modified and from which
function. The main goal is to dectect functions which are able to impact
error code value.


## [MH3GetSessionErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/MH3GetSessionErrorCode.md)
### Description
This function is based on data located:
 * __RMHJ08:__ -0x4298 (r13)
 * __RMHE08:__ -0x4128 (r13)
 * __RMHP08:__ -0x4038 (r13)
 
### Error Codes
#### 11620
 * TODO
 
#### 11621
 * TODO
 
#### 11622
 * TODO
 
#### 11623
 * TODO
 
#### 11624
 * TODO
 
#### 11625
 * TODO
 
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
 * TODO
 
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
 * TODO
 
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
 * TODO

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
 * TODO

#### 11610
 * TODO

#### 11611
 * TODO

#### 11612
 * TODO


## [getNetworkTCPErrorCode](https://github.com/sepalani/MHTrIDA/blob/master/server/doc/getNetworkTCPErrorCode.md)
### Description
This function is based on data located in the **NetworkError** structure passed as pointer parameter in **r3**:
 * __RMHJ08:__ 0x0004 (r3), 0x0008 (r3)
 * __RMHE08:__ 0x0004 (r3), 0x0008 (r3)
 * __RMHP08:__ 0x0004 (r3), 0x0008 (r3)
 
### Error Codes
#### 11612
 * TODO

#### 11613
 * TODO

#### 11614
 * TODO

#### 11615
 * TODO

#### 11616
 * TODO