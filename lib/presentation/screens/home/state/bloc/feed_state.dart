import 'package:ezy_course/domain/entities/feed/feed.dart';

abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<Feed> feeds;

  FeedLoaded({required this.feeds});
}

class FeedError extends FeedState {
  final String message;

  FeedError({required this.message});
}
