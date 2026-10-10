using Godot;
using Youtube.Api.V3;

[GlobalClass]
public partial class NewSponsorDetailsGenerator : LiveChatMessageGenerator
{
    protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.NewSponsorEvent;
    }

    protected override LiveChatMessage Fill(LiveChatMessage m)
    {
		m.Snippet.NewSponsorDetails = new LiveChatNewSponsorDetails()
        {
            MemberLevelName = "member level name",
            IsUpgrade = true
        };
		return m;
    }
}
