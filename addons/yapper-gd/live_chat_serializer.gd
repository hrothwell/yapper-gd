class_name LiveChatSerializer extends RefCounted

static func deserialize_message(json: String) -> LiveChatMessage:
	var dict: Dictionary = JSON.parse_string(json)
	var result := LiveChatMessage.new()
	result.id = dict.get("id", "")
	result.etag = dict.get("etag", "")
	
	if dict.has("authorDetails"):
		result.author_details = LiveChatMessageAuthorDetails.from_dict(dict["authorDetails"])
	
	if dict.has("snippet"):
		result.snippet = LiveChatMessageSnippet.from_dict(dict.get("snippet"))
	return result
