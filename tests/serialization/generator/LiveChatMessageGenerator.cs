using Godot;
using Google.Protobuf;
using System;
using Youtube.Api.V3;

// Shared data for tests, sets root level data of message
public partial class LiveChatMessageGenerator : RefCounted
{
	public string Get()
	{
		LiveChatMessage m = Init();
		m = Fill(m);
		return JsonFormatter.Default.Format(m);
	}

	virtual protected LiveChatMessage Fill(LiveChatMessage m)
	{
		return m;
	}

	protected virtual LiveChatMessageSnippet.Types.TypeWrapper.Types.Type EventType()
	{
		return LiveChatMessageSnippet.Types.TypeWrapper.Types.Type.InvalidType;
	}

	private LiveChatMessage Init()
	{
		LiveChatMessage msg = new LiveChatMessage();
		msg.Id = "id";
		msg.Etag = "etag";
		msg.AuthorDetails = GetAuthorDetails();

		msg.Snippet = new LiveChatMessageSnippet()
		{
			Type = EventType(),
			LiveChatId = "live chat id",
			AuthorChannelId = "author channel id",
			PublishedAt = DateTime.Now.ToString(),
			HasDisplayContent = true,
			DisplayMessage = "display message"
		};

		return msg;
	}

	private LiveChatMessageAuthorDetails GetAuthorDetails()
	{
		LiveChatMessageAuthorDetails deatils = new LiveChatMessageAuthorDetails();
		deatils.DisplayName = "display name";
		deatils.ProfileImageUrl = "profile image url";
		// nothing else is used 
		return deatils;
	}
}
