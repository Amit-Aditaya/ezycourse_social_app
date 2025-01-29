import 'package:ezy_course/domain/entities/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(String email, String password);
}
