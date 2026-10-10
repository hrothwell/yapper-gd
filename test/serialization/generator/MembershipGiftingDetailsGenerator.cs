using Godot;
using Youtube.Api.V3;

[GlobalClass]
public partial class MembershipGiftingDetailsGenerator : LiveChatMessageGenerator
{
    protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.MembershipGiftingEvent;
    }

    protected override LiveChatMessage Fill(LiveChatMessage m)
    {
		m.Snippet.MembershipGiftingDetails = new LiveChatMembershipGiftingDetails()
        {
           GiftMembershipsCount = 1,
           GiftMembershipsLevelName = "gift memberships level name"
        };
		return m;
    }
}
