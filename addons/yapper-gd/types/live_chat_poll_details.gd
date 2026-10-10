class_name LiveChatPollDetails extends RefCounted

enum PollStatus {
	UNKNOWN,
	ACTIVE,
	CLOSED
}

var metadata: PollMetadata
var status: PollStatus

static func from_dict(dict: Dictionary) -> LiveChatPollDetails:
	var result := LiveChatPollDetails.new()
	if dict.has("metadata"):
		result.metadata = PollMetadata.from_dict(dict.get("metadata"))
	result.status = PollStatus.get(dict.get("status", "UNKNOWN"))
	return result

class PollMetadata extends RefCounted:
	var question_text: String
	var options: Array[PollOption]
	static func from_dict(dict: Dictionary) -> PollMetadata:
		var result := PollMetadata.new()
		result.question_text = dict.get("questionText", "")
		if dict.has("options"):
			var arr: Array = dict.get("options")
			var options: Array[PollOption] = []
			for o in arr:
				options.append(PollOption.from_dict(o))
			result.options = options
		return result

class PollOption extends RefCounted:
	var option_text: String
	var tally: int
	static func from_dict(dict: Dictionary) -> PollOption:
		var result := PollOption.new()
		result.option_text = dict.get("optionText", "")
		result.tally = dict.get("tally", -1)
		return result
