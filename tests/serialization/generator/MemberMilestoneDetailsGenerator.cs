using Godot;
using Youtube.Api.V3;

[GlobalClass]
public partial class MemberMilestoneDetailsGenerator : LiveChatMessageGenerator
{
    protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.MemberMilestoneChatEvent;
    }

    protected override LiveChatMessage Fill(LiveChatMessage m)
    {
		m.Snippet.MemberMilestoneChatDetails = new LiveChatMemberMilestoneChatDetails()
        {
            MemberLevelName = "member level name",
            MemberMonth = 1,
            UserComment = "user comment"
        };
		return m;
    }
}
