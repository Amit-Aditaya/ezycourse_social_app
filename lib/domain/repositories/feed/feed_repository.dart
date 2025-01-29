import 'package:ezy_course/domain/entities/feed/feed.dart';

abstract class FeedRepository {
  Future<List<Feed>> getFeeds(String token);
}
