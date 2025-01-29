class ApiEndpoints {
  static const String baseUrl = "https://ezycourse.com/api/app";

  static const String login = "$baseUrl/student/auth/login";

  static const String createPost =
      "$baseUrl/teacher/community/createFeedWithUpload?";

  static const String getFeeds =
      "$baseUrl/teacher/community/getFeed?status=feed&";
}
