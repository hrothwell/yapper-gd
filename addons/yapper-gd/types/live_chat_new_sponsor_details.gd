class_name LiveChatNewSponsorDetails extends RefCounted

var member_level_name: String
var is_upgrade: bool

static func from_dict(dict: Dictionary) -> LiveChatNewSponsorDetails:
	var result := LiveChatNewSponsorDetails.new()
	result.member_level_name = dict.get("memberLevelName", "")
	result.is_upgrade = dict.get("isUpgrade", false)
	return result
