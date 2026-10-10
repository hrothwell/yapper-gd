using Godot;
using Youtube.Api.V3;

[GlobalClass]
public partial class SuperStickerDetailsGenerator : LiveChatMessageGenerator
{
    protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.SuperStickerEvent;
    }

    protected override LiveChatMessage Fill(LiveChatMessage m)
    {
		m.Snippet.SuperStickerDetails = new LiveChatSuperStickerDetails()
		{
			AmountMicros = 100,
			Currency = "currency",
			AmountDisplayString = "amount display string",
			Tier = 1,
			SuperStickerMetadata = new SuperStickerMetadata()
			{
				StickerId = "sticker id",
				AltText = "alt text",
				AltTextLanguage = "alt text language"
			}
		};
		return m;
    }
}
