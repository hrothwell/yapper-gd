class_name LiveChatSuperChatDetails extends RefCounted

var amount_micros: int
var currency: String
var amount_display_string: String
var user_comment: String
var tier: int

static func from_dict(dict: Dictionary) -> LiveChatSuperChatDetails:
	var result := LiveChatSuperChatDetails.new()
	result.amount_micros = dict.get("amountMicros", -1)
	result.currency = dict.get("currency", "")
	result.amount_display_string = dict.get("amountDisplayString", "")
	result.user_comment = dict.get("userComment", "")
	result.tier = dict.get("tier", -1)
	return result
