using Godot;
using Youtube.Api.V3;

[GlobalClass]
public partial class GiftDetailsGenerator : LiveChatMessageGenerator
{
    protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.GiftEvent;
    }

    protected override LiveChatMessage Fill(LiveChatMessage m)
    {
		m.Snippet.GiftDetails = new LiveChatGiftDetails()
        {
            GiftName = "gift name",
            GiftDuration = new Google.Protobuf.WellKnownTypes.Duration()
            {
                Seconds = 1000,
                Nanos = 200
            },
            JewelsAmount = 1,
            GiftUrl = "gift url",
            AltText = "alt text",
            Language = "language",
            HasVisualEffect = true,
            ComboCount = 1
        };
		return m;
    }
}