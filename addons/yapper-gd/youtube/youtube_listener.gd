## Use the Youtube API? There are quotas, needs oauth setup, etc. Surely there is an easier way to 
## do that if you can just have the chat popped up somewhere? Like how streamers have different CSS for
## their chats and stuff? Select what window your chat is in (must be a pop out or something), then 
## connect to that and just read the content of it? Doesn't seem like it is possible though 
## Really just trying to avoid needing API keys or rate limiting and stuff
## gRPC might be less polling and allow it to work - but might require more work. At the end of the 
## day streamers could just say "hey go use this twitch chat for this lol sorry"
class_name YouTubeListener extends ChatListener
