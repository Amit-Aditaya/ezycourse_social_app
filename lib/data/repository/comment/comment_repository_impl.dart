import 'package:ezy_course/core/exceptions/exceptions.dart';
import 'package:ezy_course/data/data_source/remote/comment/comment_remote_datasource.dart';
import 'package:ezy_course/domain/entities/comment/comment.dart';
import 'package:ezy_course/domain/repositories/comment/coomment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Comment>> getComments(String token, int feedId) async {
    try {
      final commentModels = await remoteDataSource.getComments(token, feedId);
      return commentModels
          .map((model) => Comment.fromCommentsModel(model))
          .toList();
    } catch (e) {
      throw CommentException(e.toString());
    }
  }

  @override
  Future<bool> addComment(String token, int feedId, String comment) async {
    try {
      await remoteDataSource.addComment(token, feedId, comment);
      return true;
    } catch (e) {
      return false;
    }
  }
}
