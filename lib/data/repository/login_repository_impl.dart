import 'package:ezy_course/core/exceptions/exceptions.dart';
import 'package:ezy_course/data/data_source/remote/login/login_datasource.dart';
import 'package:ezy_course/domain/entities/login/login_response.dart';
import 'package:ezy_course/domain/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await dataSource.login(email, password);
      return LoginResponse.fromJson(response);
    } catch (e) {
      throw LoginException(e.toString());
    }
  }
}
