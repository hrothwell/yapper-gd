using Godot;
using System;
using Youtube.Api.V3;

// Shared data for tests, sets root level data of message
public partial class LiveChatMessageGenerator : RefCounted
{
	virtual public String Get()
	{
		return "override me";
	}

	protected LiveChatMessage Create()
	{
		LiveChatMessage msg = new LiveChatMessage();
		msg.Id = "id";
		msg.Etag = "etag";
		msg.AuthorDetails = GetAuthorDetails();

		msg.Snippet = new LiveChatMessageSnippet()
		{
			LiveChatId = "live chat id",
			AuthorChannelId = "author channel id",
			PublishedAt = DateTime.Now.ToString(),
			HasDisplayContent = true,
			DisplayMessage = "display message"
		};

		return msg;
	}

	protected LiveChatMessageAuthorDetails GetAuthorDetails()
	{
		LiveChatMessageAuthorDetails deatils = new LiveChatMessageAuthorDetails();
		deatils.DisplayName = "display name";
		deatils.ProfileImageUrl = "profile image url";
		// nothing else is used 
		return deatils;
	}
}
