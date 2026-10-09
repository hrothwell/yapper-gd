# TODO remove Gut / have the tests in a separate package so it isn't bundled together
extends GutTest

func _base_assert(msg: LiveChatMessage):
	assert_eq(msg.id, "id")
	assert_eq(msg.etag, "etag")
	assert_eq(msg.author_details.display_name, "display name")
	assert_eq(msg.author_details.profile_image_url, "profile image url")
	assert_eq(msg.snippet.live_chat_id, "live chat id")
	assert_eq(msg.snippet.author_channel_id, "author channel id")
	assert_not_null(msg.snippet.published_at)
	assert_true(msg.snippet.published_at.length() > 0)
	assert_eq(msg.snippet.has_display_content, true)
	assert_eq(msg.snippet.display_message, "display message")

func test_deserializes_text_message_details():
	var generator = TextMessageChatGenerator.new()
	var json = generator.Get()
	var result = LiveChatSerializer.deserialize_message(json)
	_base_assert(result)
	assert_eq(result.snippet.type, LiveChatMessageSnippet.Type.TEXT_MESSAGE_EVENT)
	assert_eq(result.snippet.text_message_details.message_text, "message text")

func test_deserializes_super_chat_details():
	var generator = SuperChatGenerator.new()
	var json = generator.Get()
	var result = LiveChatSerializer.deserialize_message(json)
	_base_assert(result)
	assert_eq(result.snippet.type, LiveChatMessageSnippet.Type.SUPER_CHAT_EVENT)
	assert_eq(result.snippet.super_chat_details.amount_micros, 100)
	assert_eq(result.snippet.super_chat_details.currency, "currency")
	assert_eq(result.snippet.super_chat_details.amount_display_string, "display string")
	assert_eq(result.snippet.super_chat_details.user_comment, "user comment")
	assert_eq(result.snippet.super_chat_details.tier, 1)

func test_deserializes_user_ban_details():
	var generator = UserBannedDetailsGenerator.new()
	var json = generator.Get()
	var result = LiveChatSerializer.deserialize_message(json)
	_base_assert(result)
	assert_eq(result.snippet.type, LiveChatMessageSnippet.Type.USER_BANNED_EVENT)
	assert_eq(result.snippet.user_banned_details.banned_user_details.channel_id, "channel id")
	assert_eq(result.snippet.user_banned_details.banned_user_details.channel_url, "channel url")
	assert_eq(result.snippet.user_banned_details.banned_user_details.display_name, "display name")
	assert_eq(result.snippet.user_banned_details.banned_user_details.profile_image_url, "profile image url")
	assert_eq(result.snippet.user_banned_details.ban_type, LiveChatUserBannedMessageDetails.BanType.PERMANENT)
	assert_eq(result.snippet.user_banned_details.ban_duration_seconds, 100)
