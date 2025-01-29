import 'package:ezy_course/core/exceptions/exceptions.dart';
import 'package:ezy_course/data/data_source/api_endpoints.dart';
import 'package:ezy_course/data/model/comment_model.dart';
import 'package:http/http.dart' as http;

abstract class CommentRemoteDataSource {
  Future<List<CommentsModel>> getComments(String token, int feedId);
  Future<bool> addComment(String token, int feedId, String comment);
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  CommentRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<CommentsModel>> getComments(String token, int feedId) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/student/comment/getComment/$feedId?more=null'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return commentsModelFromJson(response.body);
      } else {
        throw CommentException(
            'Failed to fetch comments: ${response.statusCode}');
      }
    } catch (e) {
      throw CommentException(e.toString());
    }
  }

  @override
  Future<bool> addComment(String token, int feedId, String comment) async {
    try {
      final response =
          await client.post(Uri.parse(ApiEndpoints.addComment), headers: {
        'Authorization': 'Bearer $token',
      }, body: {
        'feed_id': "226612",
        "comment_txt": comment,
        "commentSource": "COMMUNITY"
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
