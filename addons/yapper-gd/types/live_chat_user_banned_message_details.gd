class_name LiveChatUserBannedMessageDetails extends RefCounted

enum BanType {
	PERMANENT,
	TEMPORARY
}
var banned_user_details: ChannelProfileDetails
var ban_type: BanType
var ban_duration_seconds: int

static func from_dict(dict: Dictionary) -> LiveChatUserBannedMessageDetails:
	var result := LiveChatUserBannedMessageDetails.new()
	result.ban_duration_seconds = dict.get("banDurationSeconds")
	result.ban_type = BanType.get(dict.get("banType", "PERMANENT"))
	
	if dict.has("bannedUserDetails"):
		result.banned_user_details = ChannelProfileDetails.from_dict(dict.get("bannedUserDetails"))
	return result

class ChannelProfileDetails extends RefCounted:
	var channel_id: String
	var channel_url: String
	var display_name: String
	var profile_image_url: String

	static func from_dict(dict: Dictionary) -> ChannelProfileDetails:
		var result := ChannelProfileDetails.new()
		result.channel_id = dict.get("channelId", "")
		result.channel_url = dict.get("channelUrl", "")
		result.display_name = dict.get("displayName", "")
		result.profile_image_url = dict.get("profileImageUrl", "")
		return result
