using Godot;
using System;
using System.Threading;
using System.Threading.Tasks;
using Grpc.Net.Client;
using Youtube.Api.V3;
using Grpc.Core;
using Google.Protobuf;

/**
	YouTube API refernce: https://developers.google.com/youtube/v3/live/docs/liveChatMessages/streamList
	
	Opens a stream to a youtube chat. Response `items` array values are emitted as json independently through [MessageReceived]. For structure of response see reference.

	[ApiKey] and [LiveChatId] must be present. [ApiKey] is strongly suggested to be loaded via some config file. DO NOT STORE THEM IN VERSION CONTROL I WILL STEAL THEM TO TEACH YOU A LESSON. 
	
	[LiveChatId] can be fetched via another API - https://developers.google.com/youtube/v3/docs/videos/list
	A small gdscript HTTP client call is included to provide this - [GetLiveChatId]
	
	Start the stream via [Start]
	
	[Stopped] is emitted if the polling has failed, completed, or some other unexpected issue. 
*/
[GlobalClass]
public partial class YouTubeChatStream : Node
{
	[Signal]
	public delegate void MessageReceivedEventHandler(string json);
	
	[Signal]
	public delegate void StoppedEventHandler();

	public string ApiKey = "";

	[Export]
	public string LiveChatId = "";

	// Messages older than this many seconds will be skipped / not emitted
	[Export]
	public int MessageCutoffSeconds = 30;

	private GrpcChannel _chat_channel;
	private CancellationTokenSource _cancellation_token_source;
	private Task _running_task = null;

	private bool _running = false;

	public void Start()
	{
		if (_running_task != null) return;

		if (ApiKey == null || ApiKey.Trim().Length == 0)
		{
			throw new ArgumentException("ApiKey must be non-null and non-empty");
		}

		if (LiveChatId == null || LiveChatId.Trim().Length == 0)
		{
			throw new ArgumentException("LiveChatId must be non-null and non-empty");
		}

		_cancellation_token_source = new CancellationTokenSource();
		_running_task = Task.Run(() => StartGrpcStream(_cancellation_token_source.Token));
		_running_task.ContinueWith((pollingTask) =>
		{
			GD.Print("Polling ended");
			_running_task = null;
			CallDeferred(MethodName.EmitSignal, SignalName.Stopped);
		});
	}

	private async Task StartGrpcStream(CancellationToken token)
	{
		try
		{
			var credentials = new GrpcChannelOptions { Credentials = ChannelCredentials.SecureSsl };
			_chat_channel = GrpcChannel.ForAddress("dns:///youtube.googleapis.com:443", credentials);
			var client = new V3DataLiveChatMessageService.V3DataLiveChatMessageServiceClient(_chat_channel);
			String nextPage = null;

			while(true)
			{
				_running = true;
				var request = new LiveChatMessageListRequest { 
					LiveChatId = this.LiveChatId,
					MaxResults = 20,
					Part =
					{
						"snippet", "authorDetails"
					},
				};
				if (nextPage != null)
				{
					request.PageToken = nextPage;
				}
				
				using var call = client.StreamList(request: request, headers: [new Metadata.Entry("x-goog-api-key", ApiKey)], cancellationToken: token);
				await foreach (var response in call.ResponseStream.ReadAllAsync(token))
				{
					DateTimeOffset cutoffTime = DateTimeOffset.Now.AddSeconds(-1 * MessageCutoffSeconds);
					foreach (var item in response.Items)
					{
						if (DateTimeOffset.TryParse(item.Snippet.PublishedAt, out DateTimeOffset dto))
						{
							if (dto.CompareTo(cutoffTime) >= 0)
							{
								string jsonStr = JsonFormatter.Default.Format(item);
								CallDeferred(MethodName.EmitSignal, SignalName.MessageReceived, jsonStr);
							}
						}
					}
					nextPage = response.NextPageToken;
				}
				if (nextPage == null) break;
			}
		}
		catch (Exception e)
		{
			GD.PrintErr($"gRPC Stream Error: {e.Message} {e.StackTrace}");
		}

		GD.Print("Exiting polling task");
	}

	 public override void _ExitTree()
	{
		_cancellation_token_source?.Cancel();
		_chat_channel?.Dispose();
	}
}
