abstract class CommentEvent {}

class SetCommentParameters extends CommentEvent {
  final String token;
  final int feedId;

  SetCommentParameters({required this.token, required this.feedId});
}

class FetchComments extends CommentEvent {}

class RefreshComments extends CommentEvent {}

class AddComment extends CommentEvent {
  final String comment;

  AddComment({required this.comment});
}
