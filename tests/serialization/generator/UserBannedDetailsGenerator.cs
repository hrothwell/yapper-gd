using Godot;
using Youtube.Api.V3;

[GlobalClass]
public partial class UserBannedDetailsGenerator : LiveChatMessageGenerator
{
	protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.UserBannedEvent;
    }
	protected override LiveChatMessage Fill(LiveChatMessage m)
	{
		m.Snippet.UserBannedDetails = new LiveChatUserBannedMessageDetails()
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
		
		return m;
	}
}
