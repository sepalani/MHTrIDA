# TCP Servers

Here are the technical information about the game servers' behaviors.


Port 8200
---------
The first resquest need at least 8 bytes to end. It's a kind of header for the content the client will read. Here is a basic structure of what is known. The request will end after the data size bytes being sent.

Pseudo C translation:
```C
struct
{
  int16_t size;
  int16_t nonce;
  int32_t checksum;
  uint8_t data[0];
}
```

**Header Part**
 * [0x00~0x01] **data size**
 * [0x02~0x03] **random number**
 * [0x04~0x07] **checksum** 

**Data Part**
 * [0x08~0x08+**data size**] request data
