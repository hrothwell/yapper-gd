using Godot;
using Google.Protobuf;
using System;
using Youtube.Api.V3;

[GlobalClass]
public partial class SuperChatGenerator : LiveChatMessageGenerator
{

    protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.SuperChatEvent;;
    }


	protected override LiveChatMessage Fill(LiveChatMessage m)
	{
		m.Snippet.SuperChatDetails = new LiveChatSuperChatDetails()
		{
		  AmountMicros = 100,
		  Currency = "currency",
		  AmountDisplayString = "display string",
		  UserComment = "user comment",
		  Tier = 1
		};
		
		return m;
	}
}
