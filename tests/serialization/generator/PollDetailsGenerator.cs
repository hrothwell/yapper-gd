using Godot;
using Youtube.Api.V3;

[GlobalClass]
public partial class PollDetailsGenerator : LiveChatMessageGenerator
{
    protected override LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
    {
        return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.PollEvent;
    }

    protected override LiveChatMessage Fill(LiveChatMessage m)
    {
        var metadata = new LiveChatPollDetails.Types.PollMetadata()
          {
              QuestionText = "question text"
          };
        metadata.Options.Add(
            new LiveChatPollDetails.Types.PollMetadata.Types.PollOption()
            {
                OptionText = "option text",
                Tally = 1
            }
        );
        metadata.Options.Add(
            new LiveChatPollDetails.Types.PollMetadata.Types.PollOption()
            {
                OptionText = "option text 2",
                Tally = 2
            }
        );
		m.Snippet.PollDetails = new LiveChatPollDetails()
        {
          Metadata = metadata,
          Status = LiveChatPollDetails.Types.PollStatusWrapper.Types.PollStatus.Closed
        };
		return m;
    }
}