# yapper-gd

yapper-gd is a small addon for the Godot game engine that enables streaming of a live YouTube chat using the **official** YouTube Data API V3.

There seem to exist many instances using what is known as "inner-tube" - YouTube's own internal / undocumented APIs - this focuses on a more intended and well documented route. However, this does come with the unfortunate need of an API key and a daily quota limit. Quota's can be increased as necessary, however, yapper-gd is intended (or rather suggested) to work using per-user API keys rather than per-game API keys. This puts the processing onto the user machine but also relies on a user setting up keys. 

## Install
1. copy contents of `addons/yapper-gd` or download via asset store (TBD)
2. copy `ItemGroup` dependencies of `yapper-gd.csproj` into desired project 
3. `dotnet build` or build within Godot editor

## Why even make this when Twitch and other options exist?
1. VTubers prefer YouTube
2. I like VTubers
3. I like watching VTubers on YouTube

## Why the official API rather than inner-tube?
1. Actually documented 
2. Good stewardship 
3. Potential legal reasons / terms of service

## Quota usage benchmark

During a 37 minute session with an average of ~4,500 viewers and ~3,200 total messages received (86 messages per minute), my total quota usage was 1,096 out of a default value of 10,000. This is ~30 quota per minute, which gives roughly 333 minutes of active time at that rate before quota limit is met. Your mileage may vary. 

Thank you to my oshi for streaming when I needed to test this. 
