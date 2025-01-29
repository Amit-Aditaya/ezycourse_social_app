part of 'post_bloc.dart';

@immutable
sealed class PostState {}

class CreatePostLoadingState extends PostState {}

class CreatePostSuccessState extends PostState {}

class CreatePostFailedState extends PostState {}
