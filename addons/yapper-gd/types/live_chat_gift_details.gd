class_name LiveChatGiftDetails extends RefCounted

var gift_name: String
var gift_duration_seconds: int
var jewels_amount: int
var gift_url: String
var alt_text: String
var language: String
var has_visual_effect: bool
var combo_count: int

static func from_dict(dict: Dictionary) -> LiveChatGiftDetails:
	var result := LiveChatGiftDetails.new()
	result.gift_name = dict.get("giftName", "")
	# giftDuration format is <seconds>.<nano seconds>s as a string. String.to_int should handle this.
	if dict.has("giftDuration"):
		var s: String = dict.get("giftDuration")
		result.gift_duration_seconds = s.to_int()
	result.jewels_amount = dict.get("jewelsAmount", -1)
	result.gift_url = dict.get("giftUrl", "")
	result.alt_text = dict.get("altText", "")
	result.language = dict.get("language", "")
	result.has_visual_effect = dict.get("hasVisualEffect", false)
	result.combo_count = dict.get("comboCount", -1)
	return result
