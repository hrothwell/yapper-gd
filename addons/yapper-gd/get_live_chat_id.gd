class_name GetLiveChatId extends Node

class Response extends RefCounted:
	var live_chat_id: String

signal complete

## api_key is intentionally not exported as it can be included in version control when set through the editor. Create instances 
## as needed via [create]
var _api_key: String
var _uri_template: String = "https://www.googleapis.com/youtube/v3/videos?key=%s&id=%s&part=liveStreamingDetails"
var _active_request: HTTPRequest = null

static func create(api_key: String) -> GetLiveChatId:
	var instance := GetLiveChatId.new()
	instance._api_key = api_key
	return instance

## Get live chat for a particular YouTube video. This ID is typically in the URL such as www.youtube.com/watch?v=<id>
func for_video_id(video_id: String): 
	if _active_request:
		print("Request already in progress")
		return
	_active_request = HTTPRequest.new()
	add_child(_active_request)
	_active_request.request_completed.connect(_parse_response, ConnectFlags.CONNECT_ONE_SHOT)
	_active_request.request(_uri_template % [_api_key.uri_encode(), video_id.uri_encode()])

func _parse_response(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	var json := body.get_string_from_utf8()
	var d: Dictionary = JSON.parse_string(json)
	var response := Response.new()
	# TODO this cannot stay...
	response.live_chat_id = d["items"][0]["liveStreamingDetails"]["activeLiveChatId"]
	complete.emit(response)
	_active_request.queue_free()
