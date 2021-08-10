# PAT debug strings

The packet names _(encoded in SHIFT-JIS)_ can be retrieved from the `main.dol`
file in all version of the game.

|Packet ID|Internal|Japanese|English
|-|-|-|-|
|60010100|recvReqLineCheck|ラインチェック|Line check|
|60010200|sendAnsLineCheck|ラインチェック|Line check|
|60020100|sendReqServerTime|サーバ時刻要求|Server time request|
|60020200|recvAnsServerTime|サーバ時刻返答|Server time reply|
|60100100|sendReqShut|切断要求|Disconnection request|
|60100200|recvAnsShut|切断返答|Disconnection reply|
|60101000|recvNtcShut|切断通知|Disconnection notification|
|60111000|recvNtcRecconect|再接続通知|Reconnection notification|
|60200100|recvReqConnection|ＰＡＴ接続環境要求|PAT connection environment requirement|
|60200200|sendAnsConnection|ＰＡＴ接続環境返答|PAT connection environment response|
|60211000|recvNtcLogin|ログイン処理概要通知|Login process summary notification|
|60300100|sendReqTicket|ＰＡＴチケット要求|PAT ticket request|
|60300200|recvAnsTicket|ＰＡＴチケット返答|PAT ticket reply|
|60310100|recvReqTicket|ＰＡＴチケット送信|Send PAT ticket|
|60310200|sendAnsTicket|ＰＡＴチケット受信|Receive PAT ticket|
|60400100|recvReqWarning|警告文送信|Send warning text|
|60400200|sendAnsWarning|警告文受信確認|Confirmation of warning message reception|
|60501000|sendNtcCollectionLog|収集ログ通知|Collection log notification|
|60700100|sendReqCommonKey|共通鍵要求|Common key request|
|60700200|recvAnsCommonKey|共通鍵返答|Common key reply|
|60801000|sendNtcCheatCheck|チートチェックデータ送信|Send cheat check data|
|60810100|recvReqMemoryCheck|メモリ内容要求|Memory content request|
|60810200|sendAnsMemoryCheck|メモリ内容送信|Memory content transmission|
|61010100|sendReqLoginInfo|ログイン情報送信|Send login information|
|61010200|recvAnsLoginInfo|ログイン情報返信|Login information reply|
|61020100|sendReqChargeInfo|課金情報要求|Billing information request|
|61020200|recvAnsChargeInfo|課金情報返答|Billing information reply|
|61100100|sendReqUserListHead|PAT ID候補数要求|Request for the number of PAT ID candidates|
|61100200|recvAnsUserListHead|PAT ID候補数応答|PAT ID candidate count response|
|61110100|sendReqUserListData|PAT ID候補要求|PAT ID candidate request|
|61110200|recvAnsUserListData|PAT ID候補送信|Send PAT ID candidate|
|61120100|sendReqUserListFoot|PAT ID候補送信終了確認|Confirmation of completion of PAT ID candidate transmission|
|61120200|recvAnsUserListFoot|PAT ID候補送信終了返答|PAT ID candidate transmission end reply|
|61200100|sendReqUserObject|ユーザオブジェクト送信|Send user object|
|61200200|recvAnsUserObject|ユーザオブジェクト結果|User object result|
|61300100|sendReqFmpListVersion|FMPリストバージョン確認|FMP list version check|
|61300200|recvAnsFmpListVersion|FMPリストバージョン確認応答|FMP list version acknowledgment|
|61310100|sendReqFmpListHead|FMPリスト数送信|Send FMP list number|
|61310200|recvAnsFmpListHead|FMPリスト数応答|FMP list number response|
|61320100|sendReqFmpListData|FMPリスト送信|Send FMP list|
|61320200|recvAnsFmpListData|FMPリスト応答|FMP list response|
|61330100|sendReqFmpListFoot|FMPリスト送信終了|End of FMP list transmission|
|61330200|recvAnsFmpListFoot|FMPリスト送信終了|End of FMP list transmission|
|61340100|sendReqFmpInfo|FMPデータ要求|FMP data request|
|61340200|recvAnsFmpInfo|FMPデータ返答|FMP data reply|
|61400100|sendReqRfpConnect|RFPの接続先要求|RFP connection request|
|61400200|recvAnsRfpConnect|RFPの接続先応答|RFP destination response|
|62010100|sendReqLmpConnect|LMPの接続先要求|LMP connection destination request|
|62010200|recvAnsLmpConnect|LMPの接続先応答|LMP destination response|
|62100100|sendReqTermsVersion|利用規約情報確認|Confirmation of terms of use information|
|62100200|recvAnsTermsVersion|利用規約情報応答|Terms of use information response|
|62110100|sendReqTerms|利用規約要求|Terms of use request|
|62110200|recvAnsTerms|利用規約応答|Terms of use response|
|62130100|sendReqSubTermsInfo|サブ利用規約指定情報確認|Sub-Terms of Service Designation Information Confirmation|
|62130200|recvAnsSubTermsInfo|サブ利用規約指定情報応答|Sub-Terms of Service Specified Information Response|
|62140100|sendReqSubTerms|サブ利用規約要求|Sub-Terms of Service Request|
|62140200|recvAnsSubTerms|サブ利用規約応答|Sub-Terms of Service Response|
|62200100|sendReqMaintenance|メンテナンス情報要求|Maintenance information request|
|62200200|recvAnsMaintenance|メンテナンス情報通知|Maintenance information notification|
|62300100|sendReqAnnounce|お知らせ要求|Notification request|
|62300200|recvAnsAnnounce|お知らせ通知|Notification Notification|
|62310100|sendReqNoCharge|未課金メッセージ要求|Unpaid message request|
|62310200|recvAnsNoCharge|未課金メッセージ通知|Unpaid message notification|
|62410100|sendReqMediaVersionInfo|新メディアバージョン送信|Send new media version|
|62410200|recvAnsMediaVersionInfo|新メディアバージョン返答|New media version reply|
|62500100|sendReqVulgarityInfoHigh|名前用禁止文言要求|Prohibition wording request for name|
|62500200|recvAnsVulgarityInfoHigh|名前用禁止文言応答|Forbidden wording response for names|
|62510100|sendReqVulgarityHigh|名前用禁止文言取得要求|Request for acquisition of prohibited words for names|
|62510200|recvAnsVulgarityHigh|名前用禁止文言取得応答|Forbidden wording acquisition response for name|
|62520100|sendReqVulgarityInfoLow|名前以外用禁止文言要求|Prohibition wording request for other than name|
|62520200|recvAnsVulgarityInfoLow|名前以外用禁止文言応答|Prohibited wording response for other than name|
|62530100|sendReqVulgarityLow|名前以外用禁止文言取得要求|Request for acquisition of prohibited words for other than name|
|62530200|recvAnsVulgarityLow|名前以外用禁止文言取得応答|Prohibition word acquisition response for other than name|
|62540100|sendReqVulgarityInfoHigh|真・名前用禁止文言要求|(New) Prohibition wording request for name|
|62540200|recvAnsVulgarityInfoHigh|真・名前用禁止文言応答|(New) Forbidden wording response for name|
|62550100|sendReqVulgarityHigh|真・名前用禁止文言取得要求|(New) Request for acquisition of prohibited words for name|
|62550200|recvAnsVulgarityHigh|真・名前用禁止文言取得応答|(New) Forbidden wording acquisition response for name|
|62560100|sendReqVulgarityInfoLow|真・名前以外用禁止文言要求|(New) Prohibition wording request for anything other than name|
|62560200|recvAnsVulgarityInfoLow|真・名前以外用禁止文言応答|(New) Prohibition wording response for anything other than name|
|62570100|sendReqVulgarityLow|真・名前以外用禁止文言取得要求|(New) Request to obtain prohibited words for anything other than name|
|62570200|recvAnsVulgarityLow|真・名前以外用禁止文言取得応答|(New) Prohibition word acquisition response for other than name|
|62600100|sendReqAuthenticationToken|認証トークン送信|Send authentication token|
|62600200|recvAnsAuthenticationToken|認証トークン返答|Authentication token reply|
|63010100|sendReqBinaryVersion|バイナリバージョン確認|Binary version check|
|63010200|recvAnsBinaryVersion|バイナリバージョン確認応答|Binary version acknowledgment|
|63020100|sendReqBinaryHead|バイナリデータ開始要求|Binary data start request|
|63020200|recvAnsBinaryHead|バイナリデータ開始応答|Binary data start response|
|63030100|sendReqBinaryData|バイナリデータ要求|Binary data request|
|63030200|recvAnsBinaryData|バイナリデータ応答|Binary data response|
|63040100|sendReqBinaryFoot|バイナリデータ完了要求|Binary data completion request|
|63040200|recvAnsBinaryFoot|バイナリデータ完了応答|Binary data completion response|
|63100100|sendReqFmpListVersion|FMPリストバージョン確認|FMP list version check|
|63100200|recvAnsFmpListVersion|FMPリストバージョン確認応答|FMP list version acknowledgment|
|63110100|sendReqFmpListHead|FMPリスト数要求|FMP list count request|
|63110200|recvAnsFmpListHead|FMPリスト数応答|FMP list number response|
|63120100|sendReqFmpListData|FMPリスト要求|FMP list request|
|63120200|recvAnsFmpListData|FMPリスト応答|FMP list response|
|63130100|sendReqFmpListFoot|FMPリスト終了送信|FMP list end send|
|63130200|recvAnsFmpListFoot|FMPリスト終了返答|FMP list end reply|
|63140100|sendReqFmpInfo|FMPデータ要求|FMP data request|
|63140200|recvAnsFmpInfo|FMPデータ返答|FMP data reply|
|64010100|sendReqLayerStart|レイヤ開始要求|Layer start request|
|64010200|recvAnsLayerStart|レイヤ開始応答|Layer start response|
|64020100|sendReqLayerEnd|レイヤ終了要求|Layer end request|
|64020200|recvAnsLayerEnd|レイヤ終了応答|Layer end response|
|64031000|recvNtcLayerUserNum|レイヤ人数通知|Layer number notification|
|64100100|sendReqLayerJump|レイヤ移動要求（位置バイナリ）|Layer move request (position binary)|
|64100200|recvAnsLayerJump|レイヤ移動返答（位置バイナリ）|Layer move reply (position binary)|
|64110100|sendReqLayerCreateHead|レイヤ作成要求（番号指定）|Layer creation request (number specified)|
|64110200|recvAnsLayerCreateHead|レイヤ作成返答|Layer creation reply|
|64120100|sendReqLayerCreateSet|レイヤ作成設定要求（番号指定）|Layer creation setting request (number specification)|
|64120200|recvAnsLayerCreateSet|レイヤ作成設定返答|Layer creation setting reply|
|64130100|sendReqLayerCreateFoot|レイヤ作成完了要求（番号指定）|Layer creation completion request (number specified)|
|64130200|recvAnsLayerCreateFoot|レイヤ作成完了返答|Layer creation completion reply|
|64140100|sendReqLayerDown|レイヤダウン要求（番号指定）|Layer down request (number specified)|
|64140200|recvAnsLayerDown|レイヤダウン返答|Layer down reply|
|64141000|recvNtcLayerIn|レイヤイン通知|Layer-in notification|
|64150100|sendReqLayerUp|レイヤアップ要求|Layer up request|
|64150200|recvAnsLayerUp|レイヤアップ返答|Layer up reply|
|64151000|recvNtcLayerOut|レイヤアウト返答|Layer out reply|
|64160100|sendReqLayerJumpReady|レイヤ予約移動確認要求|Layer reservation move confirmation request|
|64160200|recvNtcLayerJumpReady|レイヤ予約移動確認返答|Layer reservation move confirmation reply|
|64170100|sendReqLayerJumpGo|レイヤ予約移動実行要求|Layer reserved move execution request|
|64170200|recvNtcLayerJumpGo|レイヤ予約移動実行返答|Layer reservation move execution reply|
|64200100|sendReqLayerInfoSet|レイヤ情報設定要求|Layer information setting request|
|64200200|recvAnsLayerInfoSet|レイヤ情報設定返答|Layer information setting reply|
|64201000|recvNtcLayerInfoSet|レイヤ情報設定通知|Layer information setting notification|
|64210100|sendReqLayerInfo|レイヤ情報要求|Layer information request|
|64210200|recvAnsLayerInfo|レイヤ情報返答|Layer information reply|
|64220100|sendReqLayerParentInfo|親レイヤ情報要求|Parent layer information request|
|64220200|recvAnsLayerParentInfo|親レイヤ情報返答|Parent layer information reply|
|64230100|sendReqLayerChildInfo|子レイヤ情報要求|Child layer information request|
|64230200|recvAnsLayerChildInfo|子レイヤ情報返答|Child layer information reply|
|64240100|sendReqLayerChildListHead|子レイヤリスト数要求|Child layer list number request|
|64240200|recvAnsLayerChildListHead|子レイヤリスト数返答|Number of child layer lists Reply|
|64250100|sendReqLayerChildListData|子レイヤリスト要求|Child layer list request|
|64250200|recvAnsLayerChildListData|子レイヤリスト返答|Child layer list reply|
|64260100|sendReqLayerChildListFoot|子レイヤリスト終了要求|Child layer list end request|
|64260200|recvAnsLayerChildListFoot|子レイヤリスト終了返答|Child layer list end reply|
|64270100|sendReqLayerSiblingListHead|兄弟レイヤリスト数要求|Sibling layer list count request|
|64270200|recvAnsLayerSiblingListHead|兄弟レイヤリスト数返答|Number of sibling layer lists Reply|
|64280100|sendReqLayerSiblingListData|兄弟レイヤリスト要求|Brother layer list request|
|64280200|recvAnsLayerSiblingListData|兄弟レイヤリスト返答|Brother layer list reply|
|64290100|sendReqLayerSiblingListFoot|兄弟レイヤリスト終了要求|Brother layer list end request|
|64290200|recvAnsLayerSiblingListFoot|兄弟レイヤリスト終了返答|Brother layer list end reply|
|64410100|sendReqLayerHost|レイヤのホスト者要求|Layer host request|
|64410200|recvAnsLayerHost|レイヤのホスト者返答|Layer host response|
|64411000|recvNtcLayerHost|レイヤのホスト通知|Layer host notification|
|64600100|sendReqLayerUserInfoSet|レイヤユーザデータ設定要求|Layer user data setting request|
|64600200|recvAnsLayerUserInfoSet|レイヤユーザデータ設定返答|Layer user data setting reply|
|64601000|recvNtcLayerUserInfoSet|レイヤユーザデータ設定通知|Layer user data setting notification|
|64630100|sendReqLayerUserList|レイヤ同期ユーザリスト要求|Layer sync user list request|
|64630200|recvAnsLayerUserList|レイヤ同期ユーザリスト返答|Layer sync user list reply|
|64640100|sendReqLayerUserListHead|レイヤユーザリスト数要求|Layer user list count request|
|64640200|recvAnsLayerUserListHead|レイヤユーザリスト数返答|Layer user list number reply|
|64650100|sendReqLayerUserListData|レイヤユーザリスト要求|Layer user list request|
|64650200|recvAnsLayerUserListData|レイヤユーザリスト返答|Layer user list reply|
|64660100|sendReqLayerUserListFoot|レイヤユーザリスト終了要求|Layer user list end request|
|64660200|recvAnsLayerUserListFoot|レイヤユーザリスト終了返答|Layer user list end reply|
|64670100|sendReqLayerUserSearchHead|レイヤユーザ検索リスト数要求|Layer user search list count request|
|64670200|recvAnsLayerUserSearchHead|レイヤユーザ検索リスト数返答|Layer user search list number response|
|64680100|sendReqLayerUserSearchData|レイヤユーザ検索リスト要求|Layer user search list request|
|64680200|recvAnsLayerUserSearchData|レイヤユーザ検索リスト返答|Layer user search list response|
|64690100|sendReqLayerUserSearchFoot|レイヤユーザ検索リスト終了要求|Layer user search list end request|
|64690200|recvAnsLayerUserSearchFoot|レイヤユーザ検索リスト終了返答|Layer user search list end reply|
|64701000|recvNtcLayerBinary|レイヤユーザ用バイナリ通知|Binary notifications for layer users|
|64701000|sendNtcLayerBinary|レイヤユーザ用バイナリ送信|Binary transmission for layer users|
|64711000|recvNtcLayerUserPosition|レイヤゲームポジション受信通知|Layer game position reception notification|
|64711000|sendNtcLayerUserPosition|レイヤゲームポジション通知|Layer game position notification|
|64721000|recvNtcLayerChat|レイヤチャット通知|Layer chat notification|
|64721000|sendNtcLayerChat|レイヤチャット送信|Layer chat transmission|
|64730100|sendReqLayerTell|レイヤ相手指定チャット送信|Layer specified chat transmission|
|64730200|recvAnsLayerTell|レイヤ相手指定チャット返信|Layer partner specified chat reply|
|64731000|recvNtcLayerTell|レイヤ相手指定チャット通知|Layer partner specified chat notification|
|64741000|recvNtcLayerTellLow|レイヤ相手指定チャット通知 (通知のみ)|Layer partner specified chat notification (notification only)|
|64741000|sendNtcLayerTellLow|レイヤ相手指定チャット送信 (通知のみ)|Layer specified chat transmission (notification only)|
|64751000|recvNtcLayerBinary (partner specified)|レイヤユーザ用バイナリ通知 (相手指定)|Binary notification for layer users (specify the other party)|
|64751000|sendNtcLayerBinary (partner specified)|レイヤユーザ用バイナリ送信 (相手指定)|Binary transmission for layer users (specify the other party)|
|64800100|sendReqLayerMediationLock|レイヤ調停データ確保要求|Layer arbitration data securing request|
|64800200|recvAnsLayerMediationLock|レイヤ調停データ確保返答|Layer arbitration data secure reply|
|64801000|recvNtcLayerMediationLock|レイヤ調停データ確保通知|Layer arbitration data securing notification|
|64810100|sendReqLayerMediationUnlock|レイヤ調停データ開放要求|Layer arbitration data release request|
|64810200|recvAnsLayerMediationUnlock|レイヤ調停データ開放返答|Layer arbitration data release reply|
|64811000|recvNtcLayerMediationUnlock|レイヤ調停データ開放通知|Layer arbitration data release notification|
|64820100|sendReqLayerMediationList|レイヤ調停データリスト取得要求|Layer arbitration data list acquisition request|
|64820200|recvAnsLayerMediationList|レイヤ調停データリスト取得返答|Layer arbitration data list acquisition reply|
|64900100|sendReqLayerDetailSearchHead|レイヤ検索詳細数要求|Layer search detail request|
|64900200|recvAnsLayerDetailSearchHead|レイヤ検索詳細数返答|Layer search details number reply|
|64910100|sendReqLayerDetailSearchData|レイヤ検索詳細データ要求|Layer search detailed data request|
|64910200|recvAnsLayerDetailSearchData|レイヤ検索詳細データ返答|Layer search detailed data reply|
|64920100|sendReqLayerDetailSearchFoot|レイヤ検索詳細終了要求|Layer search details end request|
|64920200|recvAnsLayerDetailSearchFoot|レイヤ検索詳細終了返答|Layer search details end reply|
|65010100|sendReqCircleCreate|サークル作成要求|Circle creation request|
|65010200|recvAnsCircleCreate|サークル作成返答|Circle creation reply|
|65020100|sendReqCircleInfo|サークルデータ取得要求|Circle data acquisition request|
|65020200|recvAnsCircleInfo|サークルデータ取得返答|Circle data acquisition reply|
|65030100|sendReqCircleJoin|サークルイン要求|Circle-in request|
|65030200|recvAnsCircleJoin|サークルイン返答|Circle-in reply|
|65031000|recvNtcCircleJoin|サークルイン通知|Circle-in notification|
|65040100|sendReqCircleLeave|サークルアウト要求|Circle out request|
|65040200|recvAnsCircleLeave|サークルアウト返答|Circle out reply|
|65041000|recvNtcCircleLeave|サークルアウト通知|Circle out notification|
|65050100|sendReqCircleBreak|サークル解散要求|Circle dissolution request|
|65050200|recvAnsCircleBreak|サークル解散返答|Circle dissolution reply|
|65051000|recvNtcCircleBreak|サークル解散通知|Circle dissolution notice|
|65100100|sendReqCircleMatchOptionSet|マッチングオプション設定要求|Matching option setting request|
|65100200|recvAnsCircleMatchOptionSet|マッチングオプション設定返答|Matching option setting reply|
|65101000|recvNtcCircleMatchOptionSet|マッチングオプション設定通知|Matching option setting notification|
|65110100|sendReqCircleMatchOptionGet|マッチングオプション取得要求|Matching option acquisition request|
|65110200|recvAnsCircleMatchOptionGet|マッチングオプション取得返答|Matching option acquisition reply|
|65120100|sendReqCircleMatchStart|マッチング開始要求|Matching start request|
|65120200|recvAnsCircleMatchStart|マッチング開始返答|Matching start reply|
|65121000|recvNtcCircleMatchStart|マッチング開始通知|Matching start notification|
|65130100|sendReqCircleMatchEnd|マッチング終了要求|Matching end request|
|65130200|recvAnsCircleMatchEnd|マッチング終了返答|Matching end reply|
|65200100|sendReqCircleInfoSet|サークルデータ設定要求|Circle data setting request|
|65200200|recvAnsCircleInfoSet|サークルデータ設定返答|Circle data setting reply|
|65201000|recvNtcCircleInfoSet|サークルデータ設定通知|Circle data setting notification|
|65270100|sendReqCircleListLayer|サークル同期リスト要求 (レイヤ)|Circle sync list request (layer)|
|65270200|recvAnsCircleListLayer|サークル同期リスト返答 (レイヤ)|Circle sync list reply (layer)|
|65280100|sendReqCircleSearchHead|サークル検索数要求|Circle search number request|
|65280200|recvAnsCircleSearchHead|サークル検索数返答|Circle search number reply|
|65290100|sendReqCircleSearchData|サークル検索要求|Circle search request|
|65290200|recvAnsCircleSearchData|サークル検索返答|Circle search reply|
|652a0100|sendReqCircleSearchFoot|サークル検索終了要求|Circle search end request|
|652a0200|recvAnsCircleSearchFoot|サークル検索終了返答|Circle search end reply|
|65350100|sendReqCircleKick|サークルからキック要求|Kick request from the circle|
|65350200|recvAnsCircleKick|サークルからキック返答|Kick response from the circle|
|65351000|recvNtcCircleKick|サークルからキック通知|Kick notification from the circle|
|65360100|sendReqCircleDeleteKickList|キックリストから削除要求|Request to remove from kicklist|
|65360200|recvAnsCircleDeleteKickList|キックリストから削除返答|Delete reply from kick list|
|65400100|sendReqCircleHostHandover|サークルのホスト移譲要求|Circle host transfer request|
|65400200|recvAnsCircleHostHandover|サークルのホスト移譲返答|Circle host transfer reply|
|65401000|recvNtcCircleHostHandover|サークルのホスト移譲通知|Circle host transfer notice|
|65410100|sendReqCircleHost|サークルのホスト者要求|Circle host request|
|65410200|recvAnsCircleHost|サークルのホスト者返答|Circle host response|
|65411000|recvNtcCircleHost|サークルのホスト通知|Circle host notification|
|65600100|sendReqCircleUserList|サークル同期ユーザリスト要求|Circle sync user list request|
|65600200|recvAnsCircleUserList|サークル同期ユーザリスト返答|Circle sync user list reply|
|65701000|recvNtc0x6570|サークルバイナリ通知|Circle binary notification|
|65701000|sendNtc0x6570|サークルバイナリ送信|Circle binary transmission|
|65711000|recvNtc0x6571|サークルバイナリ通知 (相手指定)|Circle binary notification (specified by the other party)|
|65711000|sendNtc0x6571|サークルバイナリ送信 (相手指定)|Circle binary transmission (specified by the other party)|
|65721000|recvNtc0x6572|サークルチャット通知|Circle chat notification|
|65721000|sendNtc0x6572|サークルチャット送信|Circle chat transmission|
|65730100|sendReqCircleTell|サークル相手指定チャット送信|Circle partner specified chat transmission|
|65730200|recvAnsCircleTell|サークル相手指定チャット返信|Circle partner specified chat reply|
|65731000|recvNtcCircleTell|サークル相手指定チャット通知|Circle partner specified chat notification|
|65800100|sendReqCircleInfoNoticeSet|サークル通知定義登録要求|Circle notification definition registration request|
|65800200|recvAnsCircleInfoNoticeSet|サークル通知定義登録返答|Circle notification definition registration reply|
|65811000|recvNtcCircleListLayerCreate|サークル追加通知 (レイヤ)|Circle addition notification (layer)|
|65821000|recvNtcCircleListLayerChange|サークル変更通知 (レイヤ)|Circle change notification (layer)|
|65831000|recvNtcCircleListLayerDelete|サークル削除通知 (レイヤ)|Circle deletion notification (layer)|
|65900100|sendReqMcsCreate|MCS作成要求|MCS creation request|
|65900200|recvAnsMcsCreate|MCS作成返答|MCS creation reply|
|65901000|recvNtcMcsCreate|MCS作成通知|MCS creation notification|
|65911000|recvNtcMcsStart|MCS移行通知|MCS migration notification|
|66110100|sendReqTell|相手指定チャット送信|Send specified chat|
|66110200|recvAnsTell|相手指定チャット返信|Chat reply specified by the other party|
|66111000|recvNtcTell|相手指定チャット通知|Chat notification by partner|
|66120100|sendReqBinaryUser|相手指定バイナリ要求|Binary request|
|66120200|recvAnsBinaryUser|相手指定バイナリ返答|Binary reply specified by the other party|
|66121000|recvNtcBinaryUser|相手指定バイナリ通知|Binary notification specified by the other party|
|66131000|recvNtcBinaryServer|サーババイナリ通知|Server binary notification|
|66300100|sendReqUserSearchSet|ユーザ検索設定要求|User search setting request|
|66300200|recvAnsUserSearchSet|ユーザ検索設定返答|User search settings reply|
|66310100|sendReqUserBinarySet|ユーザ表示用バイナリ設定要求|Binary setting request for user display|
|66310200|recvAnsUserBinarySet|ユーザ表示用バイナリ設定返答|Binary setting reply for user display|
|66320100|sendReqUserBinaryNotice|ユーザ表示用バイナリ通知要求|Binary notification request for user display|
|66320200|recvAnsUserBinaryNotice|ユーザ表示用バイナリ通知返答|Binary notification reply for user display|
|66321000|recvNtcUserBinaryNotice|ユーザ表示用バイナリ通知通知|Binary notification for user display Notification|
|66330100|sendReqUserSearchHead|ユーザ検索数要求|User search count request|
|66330200|recvAnsUserSearchHead|ユーザ検索数返答|Number of user searches Reply|
|66340100|sendReqUserSearchData|ユーザ検索要求|User search request|
|66340200|recvAnsUserSearchData|ユーザ検索返答|User search response|
|66350100|sendReqUserSearchFoot|ユーザ検索終了要求|User search end request|
|66350200|recvAnsUserSearchFoot|ユーザ検索終了返答|User search end reply|
|66360100|sendReqUserSearchInfo|ユーザ検索データ要求|User search data request|
|66360200|recvAnsUserSearchInfo|ユーザ検索データ返答|User search data reply|
|66370100|sendReqUserSearchInfoMine|ユーザ検索データ要求(自分)|User search data request (self)|
|66370200|recvAnsUserSearchInfoMine|ユーザ検索データ返答(自分)|User search data reply (self)|
|66400100|sendReqUserStatusSet|ユーザステータス設定要求|User status setting request|
|66400200|recvAnsUserStatusSet|ユーザステータス設定返答|User status setting reply|
|66410100|sendReqUserStatus|ユーザステータス要求|User status request|
|66410200|recvAnsUserStatus|ユーザステータス返答|User status reply|
|66500100|sendReqFriendAdd|フレンド登録要求|Friend registration request|
|66500200|recvAnsFriendAdd|フレンド登録返答|Friend registration reply|
|66501000|recvNtcFriendAdd|フレンド登録完了通知|Friend registration completion notification|
|66510100|sendReqFriendAccept|フレンド登録依頼返答要求|Friend registration request Reply request|
|66510200|recvAnsFriendAccept|フレンド登録依頼返答返答|Friend registration request reply reply|
|66511000|recvNtcFriendAccept|フレンド登録依頼通知|Friend registration request notification|
|66530100|sendReqFriendDelete|フレンドデータ削除要求|Friend data deletion request|
|66530200|recvAnsFriendDelete|フレンドデータ削除返答|Friend data deletion reply|
|66540100|sendReqFriendList|フレンドリスト要求|Friend list request|
|66540200|recvAnsFriendList|フレンドリスト返答|Friend list reply|
|66600100|sendReqBlackAdd|ブラックデータ登録要求|Black data registration request|
|66600200|recvAnsBlackAdd|ブラックデータ登録返答|Black data registration reply|
|66610100|sendReqBlackDelete|ブラックデータ削除要求|Black data deletion request|
|66610200|recvAnsBlackDelete|ブラックデータ削除返答|Black data deletion reply|
|66620100|sendReqBlackList|ブラックリスト要求|Blacklist request|
|66620200|recvAnsBlackList|ブラックリスト返答|Blacklist reply|
|69010100|sendReqAgreementPageNum|自動同意ページ数要求|Automatic consent page count request|
|69010200|recvAnsAgreementPageNum|自動同意ページ数返答|Automatic consent page number reply|
|69020100|sendReqAgreementPageInfo|自動同意ページ情報要求|Automatic consent page information request|
|69020200|recvAnsAgreementPageInfo|自動同意ページ情報返答|Automatic consent page information reply|
|69030100|sendReqAgreementPage|自動同意ページデータ要求|Automatic consent page data request|
|69030200|recvAnsAgreementPage|自動同意ページデータ返答|Automatic consent page data reply|
|69100100|sendReqAgreement|同意送信|Send consent|
|69100200|recvAnsAgreement|同意返答|Consent reply|
