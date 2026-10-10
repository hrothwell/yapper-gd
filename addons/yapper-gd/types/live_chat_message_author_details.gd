class_name LiveChatMessageAuthorDetails extends RefCounted

var display_name: String
var profile_image_url: String

static func from_dict(dict: Dictionary) -> LiveChatMessageAuthorDetails:
	var result := LiveChatMessageAuthorDetails.new()
	result.display_name = dict.get("displayName", "")
	result.profile_image_url = dict.get("profileImageUrl", "")
	return result
