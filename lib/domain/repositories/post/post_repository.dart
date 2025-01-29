abstract class PostRepository {
  Future<bool> createPost(String token, String content);
}
