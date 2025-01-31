import 'package:ezy_course/domain/entities/comment/comment.dart';

abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> comments;

  CommentLoaded({required this.comments});
}

class CommentError extends CommentState {
  final String message;

  CommentError({required this.message});
}
