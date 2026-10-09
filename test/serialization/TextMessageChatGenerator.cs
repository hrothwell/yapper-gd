using Godot;
using Google.Protobuf;
using System;
using Youtube.Api.V3;

[GlobalClass]
public partial class TextMessageChatGenerator : LiveChatMessageGenerator
{
	override public String Get()
	{
		LiveChatMessage msg = Create();
		msg.Snippet.Type = LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.TextMessageEvent;

		msg.Snippet.TextMessageDetails = new LiveChatTextMessageDetails()
		{
		  MessageText = "message text"  
		};
		
		return JsonFormatter.Default.Format(msg);
	}
}
