import 'package:ezy_course/data/data_source/remote/post/post_datasource.dart';
import 'package:ezy_course/domain/repositories/post/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource dataSource;

  PostRepositoryImpl({required this.dataSource});

  @override
  Future<bool> createPost(String token, String content) async {
    try {
      await dataSource.createPost(token, content);
      return true;
    } catch (e) {
      return false;
    }
  }
}
