-- Copyright (C) 2022  Sepalani
-- SPDX-License-Identifier:  AGPL-3.0-or-later

pat_protocol = Proto("PAT", "Capcom PAT Protocol")

local PAT_HDR_LEN = 8
local PAT_MAX_LEN = 0x1000  -- TODO: Verify that's correct
local PAT_NAMES = {  -- based on MH3SP's mh/constants.py
  [0x60010100] = "ReqLineCheck",
  [0x60010200] = "AnsLineCheck",
  [0x60020100] = "ReqServerTime",
  [0x60020200] = "AnsServerTime",
  [0x60100100] = "ReqShut",
  [0x60100200] = "AnsShut",
  [0x60101000] = "NtcShut",
  [0x60111000] = "NtcRecconect",
  [0x60200100] = "ReqConnection",
  [0x60200200] = "AnsConnection",
  [0x60211000] = "NtcLogin",
  [0x60300100] = "ReqTicket",
  [0x60300200] = "AnsTicket",
  [0x60310100] = "ReqTicket",
  [0x60310200] = "AnsTicket",
  [0x60400100] = "ReqWarning",
  [0x60400200] = "AnsWarning",
  [0x60501000] = "NtcCollectionLog",
  [0x60700100] = "ReqCommonKey",
  [0x60700200] = "AnsCommonKey",
  [0x60801000] = "NtcCheatCheck",
  [0x60810100] = "ReqMemoryCheck",
  [0x60810200] = "AnsMemoryCheck",
  [0x61010100] = "ReqLoginInfo",
  [0x61010200] = "AnsLoginInfo",
  [0x61020100] = "ReqChargeInfo",
  [0x61020200] = "AnsChargeInfo",
  [0x61100100] = "ReqUserListHead",
  [0x61100200] = "AnsUserListHead",
  [0x61110100] = "ReqUserListData",
  [0x61110200] = "AnsUserListData",
  [0x61120100] = "ReqUserListFoot",
  [0x61120200] = "AnsUserListFoot",
  [0x61200100] = "ReqUserObject",
  [0x61200200] = "AnsUserObject",
  [0x61300100] = "ReqFmpListVersion",
  [0x61300200] = "AnsFmpListVersion",
  [0x61310100] = "ReqFmpListHead",
  [0x61310200] = "AnsFmpListHead",
  [0x61320100] = "ReqFmpListData",
  [0x61320200] = "AnsFmpListData",
  [0x61330100] = "ReqFmpListFoot",
  [0x61330200] = "AnsFmpListFoot",
  [0x61340100] = "ReqFmpInfo",
  [0x61340200] = "AnsFmpInfo",
  [0x61400100] = "ReqRfpConnect",
  [0x61400200] = "AnsRfpConnect",
  [0x62010100] = "ReqLmpConnect",
  [0x62010200] = "AnsLmpConnect",
  [0x62100100] = "ReqTermsVersion",
  [0x62100200] = "AnsTermsVersion",
  [0x62110100] = "ReqTerms",
  [0x62110200] = "AnsTerms",
  [0x62130100] = "ReqSubTermsInfo",
  [0x62130200] = "AnsSubTermsInfo",
  [0x62140100] = "ReqSubTerms",
  [0x62140200] = "AnsSubTerms",
  [0x62200100] = "ReqMaintenance",
  [0x62200200] = "AnsMaintenance",
  [0x62300100] = "ReqAnnounce",
  [0x62300200] = "AnsAnnounce",
  [0x62310100] = "ReqNoCharge",
  [0x62310200] = "AnsNoCharge",
  [0x62410100] = "ReqMediaVersionInfo",
  [0x62410200] = "AnsMediaVersionInfo",
  [0x62500100] = "ReqVulgarityInfoHighJAP",
  [0x62500200] = "AnsVulgarityInfoHighJAP",
  [0x62510100] = "ReqVulgarityHighJAP",
  [0x62510200] = "AnsVulgarityHighJAP",
  [0x62520100] = "ReqVulgarityInfoLowJAP",
  [0x62520200] = "AnsVulgarityInfoLowJAP",
  [0x62530100] = "ReqVulgarityLowJAP",
  [0x62530200] = "AnsVulgarityLowJAP",
  [0x62540100] = "ReqVulgarityInfoHigh",
  [0x62540200] = "AnsVulgarityInfoHigh",
  [0x62550100] = "ReqVulgarityHigh",
  [0x62550200] = "AnsVulgarityHigh",
  [0x62560100] = "ReqVulgarityInfoLow",
  [0x62560200] = "AnsVulgarityInfoLow",
  [0x62570100] = "ReqVulgarityLow",
  [0x62570200] = "AnsVulgarityLow",
  [0x62600100] = "ReqAuthenticationToken",
  [0x62600200] = "AnsAuthenticationToken",
  [0x63010100] = "ReqBinaryVersion",
  [0x63010200] = "AnsBinaryVersion",
  [0x63020100] = "ReqBinaryHead",
  [0x63020200] = "AnsBinaryHead",
  [0x63030100] = "ReqBinaryData",
  [0x63030200] = "AnsBinaryData",
  [0x63040100] = "ReqBinaryFoot",
  [0x63040200] = "AnsBinaryFoot",
  [0x63100100] = "ReqFmpListVersion",
  [0x63100200] = "AnsFmpListVersion",
  [0x63110100] = "ReqFmpListHead",
  [0x63110200] = "AnsFmpListHead",
  [0x63120100] = "ReqFmpListData",
  [0x63120200] = "AnsFmpListData",
  [0x63130100] = "ReqFmpListFoot",
  [0x63130200] = "AnsFmpListFoot",
  [0x63140100] = "ReqFmpInfo",
  [0x63140200] = "AnsFmpInfo",
  [0x64010100] = "ReqLayerStart",
  [0x64010200] = "AnsLayerStart",
  [0x64020100] = "ReqLayerEnd",
  [0x64020200] = "AnsLayerEnd",
  [0x64031000] = "NtcLayerUserNum",
  [0x64100100] = "ReqLayerJump",
  [0x64100200] = "AnsLayerJump",
  [0x64110100] = "ReqLayerCreateHead",
  [0x64110200] = "AnsLayerCreateHead",
  [0x64120100] = "ReqLayerCreateSet",
  [0x64120200] = "AnsLayerCreateSet",
  [0x64130100] = "ReqLayerCreateFoot",
  [0x64130200] = "AnsLayerCreateFoot",
  [0x64140100] = "ReqLayerDown",
  [0x64140200] = "AnsLayerDown",
  [0x64141000] = "NtcLayerIn",
  [0x64150100] = "ReqLayerUp",
  [0x64150200] = "AnsLayerUp",
  [0x64151000] = "NtcLayerOut",
  [0x64160100] = "ReqLayerJumpReady",
  [0x64160200] = "NtcLayerJumpReady",
  [0x64170100] = "ReqLayerJumpGo",
  [0x64170200] = "NtcLayerJumpGo",
  [0x64200100] = "ReqLayerInfoSet",
  [0x64200200] = "AnsLayerInfoSet",
  [0x64201000] = "NtcLayerInfoSet",
  [0x64210100] = "ReqLayerInfo",
  [0x64210200] = "AnsLayerInfo",
  [0x64220100] = "ReqLayerParentInfo",
  [0x64220200] = "AnsLayerParentInfo",
  [0x64230100] = "ReqLayerChildInfo",
  [0x64230200] = "AnsLayerChildInfo",
  [0x64240100] = "ReqLayerChildListHead",
  [0x64240200] = "AnsLayerChildListHead",
  [0x64250100] = "ReqLayerChildListData",
  [0x64250200] = "AnsLayerChildListData",
  [0x64260100] = "ReqLayerChildListFoot",
  [0x64260200] = "AnsLayerChildListFoot",
  [0x64270100] = "ReqLayerSiblingListHead",
  [0x64270200] = "AnsLayerSiblingListHead",
  [0x64280100] = "ReqLayerSiblingListData",
  [0x64280200] = "AnsLayerSiblingListData",
  [0x64290100] = "ReqLayerSiblingListFoot",
  [0x64290200] = "AnsLayerSiblingListFoot",
  [0x64410100] = "ReqLayerHost",
  [0x64410200] = "AnsLayerHost",
  [0x64411000] = "NtcLayerHost",
  [0x64600100] = "ReqLayerUserInfoSet",
  [0x64600200] = "AnsLayerUserInfoSet",
  [0x64601000] = "NtcLayerUserInfoSet",
  [0x64630100] = "ReqLayerUserList",
  [0x64630200] = "AnsLayerUserList",
  [0x64640100] = "ReqLayerUserListHead",
  [0x64640200] = "AnsLayerUserListHead",
  [0x64650100] = "ReqLayerUserListData",
  [0x64650200] = "AnsLayerUserListData",
  [0x64660100] = "ReqLayerUserListFoot",
  [0x64660200] = "AnsLayerUserListFoot",
  [0x64670100] = "ReqLayerUserSearchHead",
  [0x64670200] = "AnsLayerUserSearchHead",
  [0x64680100] = "ReqLayerUserSearchData",
  [0x64680200] = "AnsLayerUserSearchData",
  [0x64690100] = "ReqLayerUserSearchFoot",
  [0x64690200] = "AnsLayerUserSearchFoot",
  [0x64701000] = "NtcLayerBinary",
  [0x64711000] = "NtcLayerUserPosition",
  [0x64721000] = "NtcLayerChat",
  [0x64730100] = "ReqLayerTell",
  [0x64730200] = "AnsLayerTell",
  [0x64731000] = "NtcLayerTell",
  [0x64741000] = "Ntc0x6474",
  [0x64751000] = "NtcLayerBinary2",  -- (partner specified)
  [0x64800100] = "ReqLayerMediationLock",
  [0x64800200] = "AnsLayerMediationLock",
  [0x64801000] = "NtcLayerMediationLock",
  [0x64810100] = "ReqLayerMediationUnlock",
  [0x64810200] = "AnsLayerMediationUnlock",
  [0x64811000] = "NtcLayerMediationUnlock",
  [0x64820100] = "ReqLayerMediationList",
  [0x64820200] = "AnsLayerMediationList",
  [0x64900100] = "ReqLayerDetailSearchHead",
  [0x64900200] = "AnsLayerDetailSearchHead",
  [0x64910100] = "ReqLayerDetailSearchData",
  [0x64910200] = "AnsLayerDetailSearchData",
  [0x64920100] = "ReqLayerDetailSearchFoot",
  [0x64920200] = "AnsLayerDetailSearchFoot",
  [0x65010100] = "ReqCircleCreate",
  [0x65010200] = "AnsCircleCreate",
  [0x65020100] = "ReqCircleInfo",
  [0x65020200] = "AnsCircleInfo",
  [0x65030100] = "ReqCircleJoin",
  [0x65030200] = "AnsCircleJoin",
  [0x65031000] = "NtcCircleJoin",
  [0x65040100] = "ReqCircleLeave",
  [0x65040200] = "AnsCircleLeave",
  [0x65041000] = "NtcCircleLeave",
  [0x65050100] = "ReqCircleBreak",
  [0x65050200] = "AnsCircleBreak",
  [0x65051000] = "NtcCircleBreak",
  [0x65100100] = "ReqCircleMatchOptionSet",
  [0x65100200] = "AnsCircleMatchOptionSet",
  [0x65101000] = "NtcCircleMatchOptionSet",
  [0x65110100] = "ReqCircleMatchOptionGet",
  [0x65110200] = "AnsCircleMatchOptionGet",
  [0x65120100] = "ReqCircleMatchStart",
  [0x65120200] = "AnsCircleMatchStart",
  [0x65121000] = "NtcCircleMatchStart",
  [0x65130100] = "ReqCircleMatchEnd",
  [0x65130200] = "AnsCircleMatchEnd",
  [0x65200100] = "ReqCircleInfoSet",
  [0x65200200] = "AnsCircleInfoSet",
  [0x65201000] = "NtcCircleInfoSet",
  [0x65270100] = "ReqCircleListLayer",
  [0x65270200] = "AnsCircleListLayer",
  [0x65280100] = "ReqCircleSearchHead",
  [0x65280200] = "AnsCircleSearchHead",
  [0x65290100] = "ReqCircleSearchData",
  [0x65290200] = "AnsCircleSearchData",
  [0x652a0100] = "ReqCircleSearchFoot",
  [0x652a0200] = "AnsCircleSearchFoot",
  [0x65350100] = "ReqCircleKick",
  [0x65350200] = "AnsCircleKick",
  [0x65351000] = "NtcCircleKick",
  [0x65360100] = "ReqCircleDeleteKickList",
  [0x65360200] = "AnsCircleDeleteKickList",
  [0x65400100] = "ReqCircleHostHandover",
  [0x65400200] = "AnsCircleHostHandover",
  [0x65401000] = "NtcCircleHostHandover",
  [0x65410100] = "ReqCircleHost",
  [0x65410200] = "AnsCircleHost",
  [0x65411000] = "NtcCircleHost",
  [0x65600100] = "ReqCircleUserList",
  [0x65600200] = "AnsCircleUserList",
  [0x65701000] = "NtcCircleBinary",
  [0x65711000] = "NtcCircleBinary2",
  [0x65721000] = "NtcCircleChat",
  [0x65730100] = "ReqCircleTell",
  [0x65730200] = "AnsCircleTell",
  [0x65731000] = "NtcCircleTell",
  [0x65800100] = "ReqCircleInfoNoticeSet",
  [0x65800200] = "AnsCircleInfoNoticeSet",
  [0x65811000] = "NtcCircleListLayerCreate",
  [0x65821000] = "NtcCircleListLayerChange",
  [0x65831000] = "NtcCircleListLayerDelete",
  [0x65900100] = "ReqMcsCreate",
  [0x65900200] = "AnsMcsCreate",
  [0x65901000] = "NtcMcsCreate",
  [0x65911000] = "NtcMcsStart",
  [0x66110100] = "ReqTell",
  [0x66110200] = "AnsTell",
  [0x66111000] = "NtcTell",
  [0x66120100] = "ReqBinaryUser",
  [0x66120200] = "AnsBinaryUser",
  [0x66121000] = "NtcBinaryUser",
  [0x66131000] = "NtcBinaryServer",
  [0x66300100] = "ReqUserSearchSet",
  [0x66300200] = "AnsUserSearchSet",
  [0x66310100] = "ReqUserBinarySet",
  [0x66310200] = "AnsUserBinarySet",
  [0x66320100] = "ReqUserBinaryNotice",
  [0x66320200] = "AnsUserBinaryNotice",
  [0x66321000] = "NtcUserBinaryNotice",
  [0x66330100] = "ReqUserSearchHead",
  [0x66330200] = "AnsUserSearchHead",
  [0x66340100] = "ReqUserSearchData",
  [0x66340200] = "AnsUserSearchData",
  [0x66350100] = "ReqUserSearchFoot",
  [0x66350200] = "AnsUserSearchFoot",
  [0x66360100] = "ReqUserSearchInfo",
  [0x66360200] = "AnsUserSearchInfo",
  [0x66370100] = "ReqUserSearchInfoMine",
  [0x66370200] = "AnsUserSearchInfoMine",
  [0x66400100] = "ReqUserStatusSet",
  [0x66400200] = "AnsUserStatusSet",
  [0x66410100] = "ReqUserStatus",
  [0x66410200] = "AnsUserStatus",
  [0x66500100] = "ReqFriendAdd",
  [0x66500200] = "AnsFriendAdd",
  [0x66501000] = "NtcFriendAdd",
  [0x66510100] = "ReqFriendAccept",
  [0x66510200] = "AnsFriendAccept",
  [0x66511000] = "NtcFriendAccept",
  [0x66530100] = "ReqFriendDelete",
  [0x66530200] = "AnsFriendDelete",
  [0x66540100] = "ReqFriendList",
  [0x66540200] = "AnsFriendList",
  [0x66600100] = "ReqBlackAdd",
  [0x66600200] = "AnsBlackAdd",
  [0x66610100] = "ReqBlackDelete",
  [0x66610200] = "AnsBlackDelete",
  [0x66620100] = "ReqBlackList",
  [0x66620200] = "AnsBlackList",
  [0x69010100] = "ReqAgreementPageNum",
  [0x69010200] = "AnsAgreementPageNum",
  [0x69020100] = "ReqAgreementPageInfo",
  [0x69020200] = "AnsAgreementPageInfo",
  [0x69030100] = "ReqAgreementPage",
  [0x69030200] = "AnsAgreementPage",
  [0x69100100] = "ReqAgreement",
  [0x69100200] = "AnsAgreement"
}

local pf_message_length = ProtoField.uint16("pat.message_length",
                                            "Message Length", base.DEC_HEX)
local pf_sequence_number = ProtoField.uint16("pat.sequence_number",
                                             "Sequence Number", base.HEX_DEC)
local pf_packet_id = ProtoField.uint32("pat.packet_id", "ID", base.HEX)
local pf_message = ProtoField.none("message", "Message", base.HEX)

pat_protocol.fields = {
  pf_message_length,
  pf_sequence_number,
  pf_packet_id,
  pf_message
}

local pe_too_long = ProtoExpert.new(
  "pat.message_length.too_long.expert", "PAT message length seems too long",
  expert.group.MALFORMED, expert.severity.ERROR
)
local pe_unknown_id = ProtoExpert.new(
  "pat.packet_id.unknown.expert", "PAT ID is unknown",
  expert.group.MALFORMED, expert.severity.WARN
)

pat_protocol.experts = { pe_too_long, pe_unknown_id }

local function add_message_length(subtree, buffer)
  local value = buffer:uint()
  local item = subtree:add(pf_message_length, buffer)
  if value > PAT_MAX_LEN then
    item:add_proto_expert_info(pe_too_long)
  end
end

local function add_packet_id(subtree, buffer)
  local value = buffer:uint()
  local name = PAT_NAMES[value]
  local item = subtree:add(pf_packet_id, buffer)
  if name then
    item:append_text(" (" .. name .. ")")
  else
    item:append_text(" (unknown)"):add_proto_expert_info(pe_unknown_id)
  end
end

local function add_message_data(subtree, buffer)
  local length = buffer:len()
  subtree:add(pf_message, buffer):append_text(" (" .. length .. " bytes)")
end

local function get_pdu_length(buffer, pinfo, offset)
  local message_length = buffer:range(offset, 2):uint()

  if message_length > PAT_MAX_LEN then
      return buffer:len()
  end

  return PAT_HDR_LEN + message_length
end

local function dissect_pdu(buffer, pinfo, tree)
  local length = buffer:len()
  if length == 0 then
    return 0
  end

  pinfo.cols.protocol = pat_protocol.name

  local subtree = tree:add(pat_protocol, buffer(), "PAT Protocol Data")

  add_message_length(subtree, buffer(0, 2))
  subtree:add(pf_sequence_number, buffer(2, 2))
  add_packet_id(subtree, buffer(4, 4))
  add_message_data(subtree, buffer(8))

  return length
end

function pat_protocol.dissector(buffer, pinfo, tree)
  -- Handle PAT protocol data unit split across several TCP packets
  -- dissect_pdu(buffer, pinfo, tree)
  dissect_tcp_pdus(buffer, tree, PAT_HDR_LEN, get_pdu_length, dissect_pdu)
end

local tcp_port = DissectorTable.get("tcp.port")
for i=8200,8299 do
  tcp_port:add(i, pat_protocol)
end
