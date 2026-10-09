## Youtube.Api.V3.LiveChatTextMessageDetails
class_name LiveChatTextMessageDetails extends RefCounted

var message_text: String

static func from_dict(dict: Dictionary) -> LiveChatTextMessageDetails:
	var result: LiveChatTextMessageDetails = LiveChatTextMessageDetails.new()
	result.message_text = dict.get("messageText", "")
	return result
