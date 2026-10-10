using Godot;
using Google.Protobuf;
using System;
using Youtube.Api.V3;

[GlobalClass]
public partial class TextMessageChatGenerator : LiveChatMessageGenerator
{
	protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.TextMessageEvent;
    }
	protected override LiveChatMessage Fill(LiveChatMessage m)
	{
		m.Snippet.TextMessageDetails = new LiveChatTextMessageDetails()
		{
		  MessageText = "message text"  
		};
		
		return m;
	}
}
