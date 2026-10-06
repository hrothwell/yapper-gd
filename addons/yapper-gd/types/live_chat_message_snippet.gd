# Youtube.Api.V3.LiveChatMessageSnippet
class_name LiveChatMessageSnippetGd extends RefCounted

# TODO ENUM
var type: Variant

var live_chat_id: String
var author_channel_id: String
var published_at: String
var has_display_content: bool
## For most cases you probably don't want this but rather something from any of the details
var display_message: String

# TODO build these types 
var text_message_details: Variant
var user_banned_details: Variant
var super_chat_details: Variant
var super_sticker_details: Variant
var new_sponsor_details: Variant
var member_milestone_chat_details: Variant
var membership_gifting_details: Variant
var gift_membership_received_details: Variant
var poll_details: Variant
var gift_details: Variant
