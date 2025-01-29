import 'package:ezy_course/domain/entities/comment/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments(String token, int feedId);
}
