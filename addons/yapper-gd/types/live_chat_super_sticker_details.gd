class_name LiveChatSuperStickerDetails extends RefCounted

var amount_micros: int
var currency: String
var amount_display_string: String
var tier: int
var super_sticker_metadata: SuperStickerMetadata

static func from_dict(dict: Dictionary) -> LiveChatSuperStickerDetails:
	var result := LiveChatSuperStickerDetails.new()
	result.amount_micros = dict.get("amountMicros", -1)
	result.currency = dict.get("currency", "")
	result.amount_display_string = dict.get("amountDisplayString", "")
	result.tier = dict.get("tier", -1)
	if dict.has("superStickerMetadata"):
		result.super_sticker_metadata = SuperStickerMetadata.from_dict(dict.get("superStickerMetadata"))
	return result

class SuperStickerMetadata extends RefCounted:
	var sticker_id: String
	var alt_text: String
	var alt_text_language: String
	static func from_dict(dict: Dictionary) -> SuperStickerMetadata:
		var result := SuperStickerMetadata.new()
		result.sticker_id = dict.get("stickerId", "")
		result.alt_text = dict.get("altText", "")
		result.alt_text_language = dict.get("altTextLanguage", "")
		return result
