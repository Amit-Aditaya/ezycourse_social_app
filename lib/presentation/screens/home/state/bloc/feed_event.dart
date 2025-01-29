abstract class FeedEvent {}

class SetToken extends FeedEvent {
  final String token;

  SetToken(this.token);
}

class FetchFeeds extends FeedEvent {}

class RefreshFeeds extends FeedEvent {}
