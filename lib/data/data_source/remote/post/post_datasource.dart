import 'package:ezy_course/data/data_source/api_endpoints.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<void> createPost(String token, String content);
}

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  PostRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<bool> createPost(String token, String content) async {
    print('xxxxxx');
    try {
      final response = await client.post(
        Uri.parse(ApiEndpoints.createPost),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'feed_txt': content,
          'community_id': "2914",
          'space_id': "5883",
          'uploadType': 'text',
          'activity_type': 'group',
          'is_background': "0",
        },
      );

      if (response.statusCode == 200) {
        print('xxxxxxx');
        print(response.body);
        return true;
      } else {
        print('xxxxxxx');
        print(response.body);
        return false;
      }
    } catch (e) {
      print('xxxxxxx');
      print(e.toString());
      return false;
    }
  }
}
