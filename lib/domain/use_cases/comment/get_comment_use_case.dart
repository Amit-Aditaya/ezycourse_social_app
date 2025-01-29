import 'package:ezy_course/domain/entities/comment/comment.dart';
import 'package:ezy_course/domain/repositories/comment/coomment_repository.dart';

class GetCommentsUseCase {
  final CommentRepository repository;

  GetCommentsUseCase({required this.repository});

  Future<List<Comment>> execute(String token, int feedId) {
    return repository.getComments(token, feedId);
  }
}
