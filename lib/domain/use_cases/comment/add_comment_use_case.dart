import 'package:ezy_course/domain/repositories/comment/coomment_repository.dart';

class AddCommentsUseCase {
  final CommentRepository repository;

  AddCommentsUseCase({required this.repository});

  Future<bool> execute(String token, int feedId, String comment) {
    return repository.addComment(token, feedId, comment);
  }
}
