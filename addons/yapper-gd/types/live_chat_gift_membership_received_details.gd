class_name LiveChatGiftMembershipReceivedDetails extends RefCounted

var member_level_name: String
var gifter_channel_id: String
var associated_membership_gifting_message_id: String

static func from_dict(dict: Dictionary) -> LiveChatGiftMembershipReceivedDetails:
	var result := LiveChatGiftMembershipReceivedDetails.new()
	result.member_level_name = dict.get("memberLevelName", "")
	result.gifter_channel_id = dict.get("gifterChannelId", "")
	result.associated_membership_gifting_message_id = dict.get("associatedMembershipGiftingMessageId", "")
	return result
