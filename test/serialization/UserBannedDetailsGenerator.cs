using Godot;
using Google.Protobuf;
using System;
using Youtube.Api.V3;

[GlobalClass]
public partial class UserBannedDetailsGenerator : LiveChatMessageGenerator
{
	override public String Get()
	{
		LiveChatMessage msg = Create();
		msg.Snippet.Type = LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.UserBannedEvent;

		msg.Snippet.UserBannedDetails = new LiveChatUserBannedMessageDetails()
		{
		  BannedUserDetails = new ChannelProfileDetails()
          {
              ChannelId = "channel id",
              ChannelUrl = "channel url",
              DisplayName = "display name",
              ProfileImageUrl = "profile image url"
          },
          BanType = LiveChatUserBannedMessageDetails.Types.BanTypeWrapper.Types.BanType.Permanent,
          BanDurationSeconds = 100
		};
		
		return JsonFormatter.Default.Format(msg);
	}
}
