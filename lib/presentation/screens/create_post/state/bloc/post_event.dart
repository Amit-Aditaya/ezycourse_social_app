part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class CreatePost extends PostEvent {
  final String content;

  CreatePost({required this.content});
}
