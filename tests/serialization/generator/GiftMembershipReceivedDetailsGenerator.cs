using Godot;
using Youtube.Api.V3;

[GlobalClass]
public partial class GiftMembershipReceivedDetailsGenerator : LiveChatMessageGenerator
{
    protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.GiftMembershipReceivedEvent;
    }

    protected override LiveChatMessage Fill(LiveChatMessage m)
    {
		m.Snippet.GiftMembershipReceivedDetails = new LiveChatGiftMembershipReceivedDetails()
        {
           MemberLevelName = "member level name",
           GifterChannelId = "gifter channel id",
           AssociatedMembershipGiftingMessageId = "associated membership gifting message id"
        };
		return m;
    }
}