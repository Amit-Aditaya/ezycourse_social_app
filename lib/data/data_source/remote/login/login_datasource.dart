import 'dart:convert';

import 'package:ezy_course/core/exceptions/exceptions.dart';
import 'package:ezy_course/data/data_source/api_endpoints.dart';
import 'package:http/http.dart' as http;

abstract class LoginDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
}

class LoginDataSourceImpl implements LoginDataSource {
  final http.Client client;
  final String baseUrl;

  LoginDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await client.post(
        Uri.parse(ApiEndpoints.login),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        final errorBody = json.decode(response.body);
        throw LoginException(errorBody['msg'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      throw LoginException(e.toString());
    }
  }
}
