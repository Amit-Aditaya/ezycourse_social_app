import 'package:ezy_course/domain/entities/feed/feed.dart';
import 'package:ezy_course/domain/repositories/feed/feed_repository.dart';

class GetFeedsUseCase {
  final FeedRepository repository;

  GetFeedsUseCase({required this.repository});

  Future<List<Feed>> execute(String token) {
    return repository.getFeeds(token);
  }
}
