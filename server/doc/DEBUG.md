# Debug

Some functions use debug strings. Here is a list of those concerning network
transactions. Do not blame me for all their mistake in them.



Misc/WiiShop
------------

```C++
Download the patch codes [%d]
DVDConvertEntrynumToPath(possibly DVDOpen or DVDChangeDir or DVDOpenDir): specified directory or file (%s) doesn't match standard 8.3 format. This is a temporary restriction and will be removed soon
Failed to create shop log file.
Failed to register network shutdown function. %d
Failed to synchronize time with network resource managers. %d
File systsem corruption during  makeShopLog().
GP_NETWORK
GP_NETWORK_ERROR
Gpatch
gpatch.rso
https://ecs.shop.wii.com/ecs/services/ECommerceSOAP
Install the patches
Invalid path or devClass in insertion notification call
makeShopLog() returned %d
makeShopLog() returned %d.
Maybe, NetworkWiiMediator::openingStop() is called after openingFinal()
network
```



NetworkBuffer
-------------

```C++
NetworkBuffer::deserialize: arg->data_buf is null.
NetworkBuffer::deserialize: arg->data_size is zero.
NetworkBuffer::deserialize: this->buf is null.
NetworkBuffer::deserialize: this->max < arg->data_size
NetworkBuffer::duplicate: arg->obj is null.
NetworkBuffer::duplicate: arg->obj->buf is null.
NetworkBuffer::duplicate: arg->obj->len is zero.
NetworkBuffer::duplicate: this->buf is null.
NetworkBuffer::duplicate: this->max < arg->obj->len
NetworkBuffer::equals: arg->obj is null.
NetworkBuffer::equals: arg->obj->buf is null.
NetworkBuffer::equals: this->buf is null.
NetworkBuffer::equals: this->len and arg->obj->len is zero.
NetworkBuffer::init: this->buf is null.
NetworkBuffer::serialize: arg->data_buf is null.
NetworkBuffer::serialize: arg->data_buf_size < this->len
NetworkBuffer::serialize: this->buf is null.
NetworkBuffer::serialize: this->len is zero.
```



NetworkCommunity
----------------

```C++
NetworkCommunity::deleteRequest: request is moving.
```



NetworkCommunityPat
-------------------

```C++
NetworkCommunityPat::deleteRequest: request is moving.
```



NetworkConnectionMcs
--------------------

```C++
NetworkConnectionMcs[%d] 1min send %d/%d recv %d
NetworkConnectionMcs[%d] connect auth timeout (%dsec)
NetworkConnectionMcs[%d] norecv timeout (%dsec)
NetworkConnectionMcs[%d] put send pool over (0x%x)
NetworkConnectionMcs[%d] shutdown end
NetworkConnectionMcs[%d] unit size over -> %d
```



NetworkConnectionStable
-----------------------

```C++
NetworkConnectionStable:send:[%d] unit size over -> %d
NetworkConnectionStable[%d] 1min send %d/%d recv %d
NetworkConnectionStable[%d] close-leave
NetworkConnectionStable[%d] close-relay
NetworkConnectionStable[%d] connect auth timeout (%dsec)
NetworkConnectionStable[%d] mtu check packet recv -> %d
NetworkConnectionStable[%d] MTU down -> %d
NetworkConnectionStable[%d] MTU is %d
NetworkConnectionStable[%d] norecv timeout (%dsec)
NetworkConnectionStable[%d] put send pool over (0x%x)
NetworkConnectionStable[%d] send control close-leave
NetworkConnectionStable[%d] send control close-relay
NetworkConnectionStable[%d] shutdown end
```



NetworkGameSpyInterface
-----------------------

```C++
NetworkGameSpyInterface::ConnectToAnybody not login GameSpy:%d
NetworkGameSpyInterface::executeError DWC_GetLastErrorEx ErrorCode:%d ErrorType:%d
NetworkGameSpyInterface::GameSpyInterfaceThreadInit GameSpyInterfaceThread Fail
NetworkGameSpyInterface::GameSpyInterfaceThreadInit GameSpyInterfaceThread Start
NetworkGameSpyInterface::move DWC_GetLastErrorEx ErrorCode:%d ErrorType:%d
NetworkGameSpyInterface::sendUnreliable DWC_SendUnreliable Error over time size %d
NetworkGameSpyInterface::setLoginCallback DWC_GetLastErrorEx ErrorCode:%d ErrorType:%d
NetworkGameSpyInterface::setMatchedSCCallback DWC_GetLastErrorEx ErrorCode:%d ErrorType:%d
NetworkGameSpyInterface::startMatch already call startMatch:%d
NetworkGameSpyInterface::startMatch match_num(%d) is greater than MAX_NUM_MATCH(%d)
NetworkGameSpyInterface::tGameSpyInterface GameSpyInterfaceThread End
```



NetworkLayer
------------

```C++
NetworkLayer::deleteRequest: request is moving.
NetworkLayer::move: request[%d] is moving, stand by...
```



NetworkLayerIdExportTo
----------------------

```C++
NetworkLayerIdExportTo: arg->data is null.
NetworkLayerIdExportTo: arg->layer_id is null.
NetworkLayerIdExportTo: this->len < arg->size
```



NetworkLayerIdImportFrom
------------------------

```C++
NetworkLayerIdImportFrom: arg->data is null.
NetworkLayerIdImportFrom: arg->size is zero.
NetworkLayerIdImportFrom: arg->this is null.
NetworkLayerIdImportFrom: this->max < arg->size
```



NetworkLayerPat
---------------

```C++
NetworkLayerPat::deleteRequest: request is moving.
NetworkLayerPat::move mVoiceMixed.mSize is invalid. %d
NetworkLayerPat::move: request[%d] is moving, stand by...
```



NetworkMultipleUdp
------------------

```C++
NetworkMultipleUdp::add: %d.%d.%d.%d:%d
NetworkMultipleUdp::add: cannot add address.
NetworkMultipleUdp::move: buf_recv_peer over. please check NetworkMultipleUdp::MAX_SIZE_BUF_PEER
NetworkMultipleUdp::receive: invalid packet %d from %d.%d.%d.%d:%d
NetworkMultipleUdp::receive: peer_id is invalid -> %d
NetworkMultipleUdp::receive: socket is NULL
NetworkMultipleUdp::remove: %d.%d.%d.%d:%d
NetworkMultipleUdp::reset: peer_id is invalid -> %d
NetworkMultipleUdp::reset: socket is NULL
NetworkMultipleUdp::send: peer_id is invalid -> %d
NetworkMultipleUdp::send: socket is NULL
```



NetworkPeerGameSpy
------------------

```C++
NetworkPeerGameSpy::put: buf_recv_peer over. please check NetworkPeerGameSpy::MAX_SIZE_BUF_PEER
```



NetworkPeerMcs
--------------

```C++
NetworkPeerMcs::put: mPacketRecvBuf over. please check sizeof(NetworkPeerMcs::mPacketRecvBuf)=0x%x<(0x%x+0x%x)
```



NetworkRequest
--------------

```C++
NetworkRequest::getArgument: arg no over %d <= %d
```



NetworkResolverWii
------------------

```C++
NetworkResolverWii::check(): NAME[%s]
```



NetworkSessionManager
---------------------

```C++
NetworkSessionManager::deleteRequest: request is moving.
NetworkSessionManager::move: request[%d] is moving, stand by...
```



NetworkSessionManagerPat
------------------------

```C++
NetworkSessionManagerPat::connectionToMember: invalide connection index -> %d
NetworkSessionManagerPat::final: finalNetwork have not done.
NetworkSessionManagerPat::memberToConnection: invalide member index -> %d
NetworkSessionManagerPat::setNetworkSessionEvent: connection_index is bad num -> %d
NetworkSessionManagerPat::uniqueIdToMember: invalide uniqueId
NetworkSessionMangaerPat::deleteRequest: request is moving.
```



NetworkSessionMcs
-----------------

```C++
NetworkSessionMcs::add: connection is NULL.
NetworkSessionMcs::execControlOne:[%d] status changed -> ESTABLISH(AWAKE)
NetworkSessionMcs::execControlOne:[%d] status changed -> SLEEP(%dsec)
NetworkSessionMcs::execControlOne:[%d] sync drop control -> 0x%08x
NetworkSessionMcs::init: my nonce is 0x%08x
NetworkSessionMcs::move: [%d] host[%d] exist.
NetworkSessionMcs::put: data overflow -> %d
NetworkSessionMcs::put: data too big -> %d
NetworkSessionMcs::set: cannot get connection work.
NetworkSessionMcs::setNetworkConnectionEvent: [%d] error. 0x%08x 0x%08x 0x%08x
NetworkSessionMcs::setNetworkConnectionEvent: [%d] nonce:0x%08x
NetworkSessionMcs::setNetworkConnectionEvent: [%d].object is NULL.
```



NetworkSessionStable
--------------------

```C++
NetworkSessionStable::downPerformance:[%d] down -> byte: %dbyte
NetworkSessionStable::downPerformance:[%d] down -> pack: %fs
NetworkSessionStable::execControlOne: relay route (SELF)[%d](0x%08x) -> (RELAY)[%d](0x%08x) -> (FORWARD)[%d](0x%08x)
NetworkSessionStable::execControlOne: relay route [%d] nonce is different 0x%08x:0x%08x
NetworkSessionStable::execControlOne: relay route [%d] nonce learning [%d] 0x%08x:0x%08x
NetworkSessionStable::execControlOne:[%d] is leave.
NetworkSessionStable::execControlOne:[%d] relay auth error -> he think:0x%08x
NetworkSessionStable::execControlOne:[%d] relay auth error -> his:0x%08x
NetworkSessionStable::execControlOne:[%d] relay auth error -> i think:0x%08x <=> his:0x%08x
NetworkSessionStable::execControlOne:[%d] relay auth error -> mine:0x%08x <=> he think:0x%08x
NetworkSessionStable::execControlOne:[%d] said i'm drop. sync_close me.
NetworkSessionStable::execControlOne:[%d] status changed -> ESTABLISH(AWAKE)
NetworkSessionStable::execControlOne:[%d] status changed -> SLEEP(%dsec)
NetworkSessionStable::execControlOne:[%d] sync drop control -> 0x%08x
NetworkSessionStable::init: my nonce is 0x%08x
NetworkSessionStable::move: [%d] %d <= %f congestion worse %d
NetworkSessionStable::move: [%d] cannot establish, but drop sync disable. -> 0x%08x
NetworkSessionStable::move: [%d] cannot establish, first connect failed.
NetworkSessionStable::move: [%d] cannot establish. kick now. -> 0x%08x
NetworkSessionStable::move: [%d] congestion worse %d
NetworkSessionStable::move: [%d] host[%d] exist.
NetworkSessionStable::move: [%d] no relay. -> %d/%d
NetworkSessionStable::move: [%d] relay connect init.
NetworkSessionStable::move: [%d] subhost[%d] exist.
NetworkSessionStable::move: [%d]'s nonce was found in mNonceDrop. sync_close now -> 0x%08x
NetworkSessionStable::move: oob sqn send. [%d] -> [%d] -> [%d] sqntop:0x%04x sqnlow:0x%04x
NetworkSessionStable::move: relay closed. [%d] -> [%d]
NetworkSessionStable::move: relay establish. [%d] -> [%d] -> [%d]
NetworkSessionStable::put: data overflow -> %d
NetworkSessionStable::put: data too big -> %d
NetworkSessionStable::send:[%d] unit size over -> %d
NetworkSessionStable::set: cannot get connection work.
NetworkSessionStable::set: connection is NULL.
NetworkSessionStable::setNetworkConnectionEvent: [%d] auth error.
NetworkSessionStable::setNetworkConnectionEvent: [%d] error. 0x%08x 0x%08x 0x%08x
NetworkSessionStable::setNetworkConnectionEvent: [%d] is leave.
NetworkSessionStable::setNetworkConnectionEvent: [%d] is relay.
NetworkSessionStable::setNetworkConnectionEvent: [%d] nonce:0x%08x sqntop:0x%04x sqnlow:0x%04x
NetworkSessionStable::setNetworkConnectionEvent: [%d] oob sqn received. sqntop:0x%04x sqnlow:0x%04x
NetworkSessionStable::setNetworkConnectionEvent: EVENT_ESTABLISH [%d].mpObject is NULL.
NetworkSessionStable::setNetworkConnectionEvent: EVENT_SHUTDOWN [%d].mpObject is NULL.
NetworkSessionStable::upPerformance[%d] up -> byte: %dbyte
NetworkSessionStable::upPerformance[%d] up -> pack: %fs
NetworkSessionStable[%d] put send pool over (0x%x)
```



NetworkSingleTcp
----------------

```C++
NetworkSingleTcp::add: %d
NetworkSingleTcp::add: cannot add peer.
NetworkSingleTcp::move: [%d] put failed. 0x%x(0x%x)/0x%x
NetworkSingleTcp::move: invalid packet. %d
NetworkSingleTcp::remove: %d
NetworkSingleTcp::remove: cannot remove peer.
NetworkSingleTcp::send: socket is NULL
```



NetworkSocketWii
----------------

```C++
NetworkSocketWii::init(): socket conect SSL
NetworkSocketWii::open(): IP[%d:%d:%d:%d] PORT[%d]
```



NetworkUniqueId
---------------

```C++
NetworkUniqueId::equals: arg is not initialized.
NetworkUniqueId::equals: arg is null.
NetworkUniqueId::equals: this is not initialized.
NetworkUniqueId::exportTo: this is not initialized.
NetworkUniqueIdEquals: arg1 is null.
NetworkUniqueIdEquals: arg2 is null.
NetworkUniqueIdExportTo: arg->data is null.
NetworkUniqueIdExportTo: this is null.
NetworkUniqueIdExportTo: this->len < arg->size
NetworkUniqueIdImportFrom: arg->data is null.
NetworkUniqueIdImportFrom: arg->size is zero.
NetworkUniqueIdImportFrom: this is null.
NetworkUniqueIdImportFrom: this->max < arg->size
NetworkUniqueIdImportFromString: arg->str is null.
NetworkUniqueIdIsValid: this is null.
```



NetworkUnitPacket
-----------------

```C++
NetworkUnitPacket::test: CRC error %04x:%04x
NetworkUnitPacket::test: Invalid version %04x:%04x
```



NetworkUnitPacketPool
---------------------

```C++
NetworkUnitPacketPool::putAllPacket: recv buf over
NetworkUnitPacketPool::putLowPacket: recv buf over
NetworkUnitPacketPool::putTopPacket: recv buf over
```



NetworkWiiMediator
------------------

```C++
NetworkWiiMediator::ECStart() must not be called, during openingStart()
NetworkWiiMediator::openingStart() maybe be called before openingInit()
NetworkWiiMediator::openingStart() must be called before ECStart()
```



PatConnection
-------------

```C++
PAT ID
PAT`
PatConnection::checkBufError: data buffer over reading
PatConnection::connectServer connect fail[%d]
PatConnection::connectServer init fail[%d]
PatConnection::connectServer open fail[%d]
PatConnection::connectServer resolver fail[%d]
PatConnection::receiveCommand fail no socket.
PatConnection::receiveCommand fail[%d]
PatConnection::sendCommand fail no socket.
PatConnection::sendCommand fail[%d]
```



PatCryptDecrypt/PatCryptEncrypt
-------------------------------

```C++
PatCryptDecrypt fail[%02Xx%02X]
PatCryptEncrypt fail[%02Xx%02X]`
```



PatInterface
------------

```C++
PatInterface::move() no receive timeout[%d]
PatInterface:getFo(): fo_num is over fo_max.
PatInterface:getFo(): fo_size is zero or minus.
PatInterface:getItemAny(): item_type %d is bad
PatInterface:getItemBinary(): item_type %d is bad
PatInterface:getItemByte(): item_type %d is bad
PatInterface:getItemLong(): item_type %d is bad
PatInterface:getItemLongLong(): item_type %d is bad
PatInterface:getItemString(): item_type %d is bad
PatInterface:getItemWord(): item_type %d is bad
PatInterface:isCallback(): mpEventCbFunc[%d] is bound over.
PatInterface:pushStack(): mStackSize is lack for align.
PatInterface:pushStack(): mStackSize is lack.
PatInterface:pushStack(): mStackSize is zero.
PatInterface:pushStack(): Require stack_size is zero.
PatInterface:setCallback(): mpEventCbFunc[%d] is bound over.
PatInterface:setConnectServerType(): setCurrentServer(%d) have not been called.
```



WiiShop
-------

```C++
q||shoplog: NANDPrivateDelete %s failed.[%d]
q|4/shared2/ec/shopsetu.log
RemovePatch
RemovePatch Callback
Shop log file created.
Shop log file removed.
shoplog: %s file created successfully.
shoplog: %s folder created.
shoplog: NANDClose %s failed.[%d]
shoplog: NANDGetLength %s failed.[%d]
shoplog: NANDPrivateCreate %s failed.[%d]
shoplog: NANDPrivateCreateDir %s failed.[%d]
shoplog: NANDPrivateOpen %s failed.[%d]
shoplog: NANDWrite %s failed.[%d]
shoplog: size of %s is [%d]
```



sNetworkLibrary
---------------

```C++
sNetworkLibrary::start(): already done %d times.
sNetworkLibrary::start: init() have not done.
sNetworkLibrary::stop() already done.
sNetworkLibrary::stop() yet %d times.
sNetworkLibrary::stop: init() have not done.
```



sNetworkLibraryWii
------------------

```C++
sNetworkLibraryWii::final: SOCleanup() have not been called.
sNetworkLibraryWii::final: SOFinish() failed.(%d)
sNetworkLibraryWii::final: SOFinish() have been finished.
sNetworkLibraryWii::init: argument is NULL.
sNetworkLibraryWii::init: DWC_Init failed.(%d)
sNetworkLibraryWii::init: DwcInitParam is NULL.
sNetworkLibraryWii::init: OSCreateThread failed.(%d)
sNetworkLibraryWii::init: reinitialized
sNetworkLibraryWii::init: SOInit() failed.(%d)
sNetworkLibraryWii::init: SOInit() have been initialized.
sNetworkLibraryWii::init: SOLibraryConfig is NULL.
sNetworkLibraryWii::start: Network Error Code is %d
sNetworkLibraryWii::start: OSCreateThread failed.(%d)
sNetworkLibraryWii::start: SOInit() failed.
sNetworkLibraryWii::start: SOStartup() already done. (%d)
sNetworkLibraryWii::start: SOStartup() failed, Link state is in transit. (%d)
sNetworkLibraryWii::start: SOStartup() failed. (%d)
sNetworkLibraryWii::stop: OSCreateThread failed.(%d)
sNetworkLibraryWii::stop: SOCleanup() already done. (%d)
sNetworkLibraryWii::stop: SOCleanup() failed, Link state is in transit. (%d)
sNetworkLibraryWii::stop: SOCleanup() failed.(%d)
```



xNetworkBuffer
--------------

```C++
xNetworkBuffer::init: this->buf is null.
```



XNetworkLayer
-------------

```C++
XNetworkLayer::move: request[%d] is moving, stand by...
```
