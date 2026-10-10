## Response based on https://developers.google.com/youtube/v3/live/streaming-live-chat#stream_listproto LiveChatMessage type
class_name LiveChatMessage extends RefCounted

var id: String
var etag: String
var snippet: LiveChatMessageSnippet
var author_details: LiveChatMessageAuthorDetails

## Helper function from parsing json response from [YouTubeChatStream.cs]
static func from_json(json: String) -> LiveChatMessage:
	var dict: Dictionary = JSON.parse_string(json)
	var result := LiveChatMessage.new()
	result.id = dict.get("id", "")
	result.etag = dict.get("etag", "")
	
	if dict.has("authorDetails"):
		result.author_details = LiveChatMessageAuthorDetails.from_dict(dict["authorDetails"])
	
	if dict.has("snippet"):
		result.snippet = LiveChatMessageSnippet.from_dict(dict.get("snippet"))
	return result
