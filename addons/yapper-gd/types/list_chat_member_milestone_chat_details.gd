class_name LiveChatMemberMilestoneChatDetails extends RefCounted

var member_level_name: String
var member_month: int
var user_comment: int

static func from_dict(dict: Dictionary) -> LiveChatMemberMilestoneChatDetails:
	var result := LiveChatMemberMilestoneChatDetails.new()
	result.member_level_name = dict.get("memberLevelName", "")
	result.member_month = dict.get("memberMonth", -1)
	result.user_comment = dict.get("userComment", -1)
	return result
