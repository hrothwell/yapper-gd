class_name LiveChatMembershipGiftingDetails extends RefCounted

var gift_memberships_count: int
var gift_memberships_level_name: String

static func from_dict(dict: Dictionary) -> LiveChatMembershipGiftingDetails:
	var result := LiveChatMembershipGiftingDetails.new()
	result.gift_memberships_count = dict.get("giftMembershipsCount", -1)
	result.gift_memberships_level_name = dict.get("giftMembershipsLevelName", "")
	return result
