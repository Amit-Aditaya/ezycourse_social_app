import 'dart:convert';

import 'package:ezy_course/core/exceptions/exceptions.dart';
import 'package:ezy_course/data/data_source/api_endpoints.dart';
import 'package:ezy_course/data/model/feed_model.dart';
import 'package:http/http.dart' as http;

abstract class FeedRemoteDataSource {
  Future<List<FeedModel>> getFeeds(String token);
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  FeedRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<FeedModel>> getFeeds(String token) async {
    try {
      final response =
          await client.post(Uri.parse(ApiEndpoints.getFeeds), headers: {
        'Authorization': 'Bearer $token',
      }, body: {
        'community_id': '2914',
        'space_id': '5883',
      });

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => FeedModel.fromJson(json)).toList();
      } else {
        throw FeedException('Failed to fetch feeds: ${response.statusCode}');
      }
    } catch (e) {
      throw FeedException(e.toString());
    }
  }
}
