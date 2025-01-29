import 'package:ezy_course/core/exceptions/exceptions.dart';
import 'package:ezy_course/data/data_source/remote/feed/feed_remote_datasource.dart';
import 'package:ezy_course/domain/entities/feed/feed.dart';
import 'package:ezy_course/domain/repositories/feed/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource remoteDataSource;

  FeedRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Feed>> getFeeds(String token) async {
    try {
      final feedModels = await remoteDataSource.getFeeds(token);
      return feedModels.map((model) => Feed.fromFeedModel(model)).toList();
    } catch (e) {
      throw FeedException(e.toString());
    }
  }
}
