extends Node2D
@onready var chat_stream: YouTubeChatStream = %YouTubeChatStream
var get_live_chat_id: GetLiveChatId
var _api_key: String

func _ready() -> void:
	_load_api_key()
	get_live_chat_id = GetLiveChatId.create(_api_key)
	add_child(get_live_chat_id)
	get_live_chat_id.complete.connect(_start_polling)
	get_live_chat_id.for_video_id("HE_yp0c2Feg")

func _start_polling(response: GetLiveChatId.Response):
	chat_stream.ApiKey = _api_key
	chat_stream.LiveChatId = response.live_chat_id
	chat_stream.Start()
	chat_stream.MessageReceived.connect(func(json: String): 
		print(json)
		print("deserialized: ", str(LiveChatMessage.from_json(json)))
	)

func _load_api_key(): 
	var auth_file = FileAccess.open("user://youtube.json", FileAccess.READ)
	if auth_file:
		var dict = JSON.parse_string(auth_file.get_as_text()) as Dictionary
		_api_key = dict["key"]
	
