class LoginException implements Exception {
  final String message;

  LoginException(this.message);

  @override
  String toString() => message;
}

class FeedException implements Exception {
  final String message;

  FeedException(this.message);

  @override
  String toString() => message;
}

class CommentException implements Exception {
  final String message;

  CommentException(this.message);

  @override
  String toString() => message;
}
