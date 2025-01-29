import 'package:ezy_course/domain/repositories/post/post_repository.dart';

class CreatePostUseCase {
  final PostRepository repository;

  CreatePostUseCase({required this.repository});

  Future<bool> execute(String token, String content) {
    return repository.createPost(token, content);
  }
}
