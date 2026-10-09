using Godot;
using Google.Protobuf;
using System;
using Youtube.Api.V3;

[GlobalClass]
public partial class SuperChatGenerator : LiveChatMessageGenerator
{
	override public String Get()
	{
		LiveChatMessage msg = Create();

		msg.Snippet.Type = LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.SuperChatEvent;

		msg.Snippet.SuperChatDetails = new LiveChatSuperChatDetails()
		{
		  AmountMicros = 100,
		  Currency = "currency",
		  AmountDisplayString = "display string",
		  UserComment = "user comment",
		  Tier = 1
		};
		
		return JsonFormatter.Default.Format(msg);
	}
}
