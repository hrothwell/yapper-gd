## Use [type] to determine which type this Snippet is and thus what details to fetch or expect
class_name LiveChatMessageSnippet extends RefCounted

enum Type {
	INVALID_TYPE,
	TEXT_MESSAGE_EVENT,
	TOMBSTONE,
	FAN_FUNDING_EVENT,
	CHAT_ENDED_EVENT,
	SPONSOR_ONLY_MODE_STARTED_EVENT,
	SPONSOR_ONLY_MODE_ENDED_EVENT,
	NEW_SPONSOR_EVENT,
	MEMBER_MILESTONE_CHAT_EVENT,
	MEMBERSHIP_GIFTING_EVENT,
	GIFT_MEMBERSHIP_RECEIVED_EVENT,
	USER_BANNED_EVENT,
	SUPER_CHAT_EVENT,
	SUPER_STICKER_EVENT,
	POLL_EVENT,
	GIFT_EVENT
}

enum _DisplayedContentOneofCase {
	NONE,
	TEXT_MESSAGE_DETAILS,
	USER_BANNED_DETAILS,
	SUPER_CHAT_DETAILS,
	SUPER_STICKER_DETAILS,
	NEW_SPONSOR_DETAILS,
	MEMBER_MILESTONE_CHAT_DETAILS,
	MEMBERSHIP_GIFTING_DETAILS,
	GIFT_MEMBERSHIP_RECEIVED_DETAILS,
	POLL_DETAILS,
	GIFT_DETAILS
}

## The type of message, this will always be present, it determines the
## contents of the message as well as which fields will be present.
var type: Type

var _displayed_content_type: _DisplayedContentOneofCase
var live_chat_id: String
var author_channel_id: String
var published_at: String
var has_display_content: bool
## For most cases you probably don't want this but rather something from any of the details. If this is missing
## the event was either TOMBSTONE or CHAT_END_EVENT
var display_message: String

var _data: Variant

#region details
var text_message_details: LiveChatTextMessageDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.TEXT_MESSAGE_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.TEXT_MESSAGE_DETAILS

var user_banned_details: LiveChatUserBannedMessageDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.USER_BANNED_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.USER_BANNED_DETAILS

var super_chat_details: LiveChatSuperChatDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.SUPER_CHAT_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.SUPER_CHAT_DETAILS

var super_sticker_details: LiveChatSuperStickerDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.SUPER_STICKER_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.SUPER_STICKER_DETAILS

var new_sponsor_details: LiveChatNewSponsorDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.NEW_SPONSOR_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.NEW_SPONSOR_DETAILS

var member_milestone_chat_details: LiveChatMemberMilestoneChatDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.MEMBER_MILESTONE_CHAT_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.MEMBER_MILESTONE_CHAT_DETAILS

var membership_gifting_details: LiveChatMembershipGiftingDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.MEMBERSHIP_GIFTING_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.MEMBERSHIP_GIFTING_DETAILS

var gift_membership_received_details: LiveChatGiftMembershipReceivedDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.GIFT_MEMBERSHIP_RECEIVED_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.GIFT_MEMBERSHIP_RECEIVED_DETAILS

var poll_details: LiveChatPollDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.POLL_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.POLL_DETAILS

var gift_details: LiveChatGiftDetails:
	get():
		if _displayed_content_type == _DisplayedContentOneofCase.GIFT_DETAILS:
			return _data
		else:
			return null
	set(new):
		_data = new
		if new == null:
			_displayed_content_type = _DisplayedContentOneofCase.NONE
		else:
			_displayed_content_type = _DisplayedContentOneofCase.GIFT_DETAILS
#endregion

static func from_dict(dict: Dictionary) -> LiveChatMessageSnippet:
	var result = LiveChatMessageSnippet.new()
	result.type = Type.get(dict.get("type", "INVALID_TYPE"))
	result.live_chat_id = dict.get("liveChatId", "")
	result.author_channel_id = dict.get("authorChannelId", "")
	result.published_at = dict.get("publishedAt", "")
	result.has_display_content = dict.get("hasDisplayContent", false)
	result.display_message = dict.get("displayMessage", "")
	
	if dict.has("textMessageDetails"):
		result.text_message_details = LiveChatTextMessageDetails.from_dict(dict.get("textMessageDetails"))
	if dict.has("userBannedDetails"):
		result.user_banned_details = LiveChatUserBannedMessageDetails.from_dict(dict.get("userBannedDetails"))
	if dict.has("superChatDetails"):
		result.super_chat_details = LiveChatSuperChatDetails.from_dict(dict.get("superChatDetails"))
	if dict.has("superStickerDetails"):
		result.super_sticker_details = LiveChatSuperStickerDetails.from_dict(dict.get("superStickerDetails"))
	if dict.has("newSponsorDetails"):
		result.new_sponsor_details = LiveChatNewSponsorDetails.from_dict(dict.get("newSponsorDetails"))
	if dict.has("memberMilestoneChatDetails"):
		result.member_milestone_chat_details = LiveChatMemberMilestoneChatDetails.from_dict(dict.get("memberMilestoneChatDetails"))
	if dict.has("membershipGiftingDetails"):
		result.membership_gifting_details = LiveChatMembershipGiftingDetails.from_dict(dict.get("membershipGiftingDetails"))
	if dict.has("giftMembershipReceivedDetails"):
		result.gift_membership_received_details = LiveChatGiftMembershipReceivedDetails.from_dict(dict.get("giftMembershipReceivedDetails"))
	if dict.has("pollDetails"):
		result.poll_details = LiveChatPollDetails.from_dict(dict.get("pollDetails"))
	if dict.has("giftDetails"):
		result.gift_details = LiveChatGiftDetails.from_dict(dict.get("giftDetails"))
	
	return result
