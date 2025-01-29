import 'package:ezy_course/domain/entities/login/login_response.dart';
import 'package:ezy_course/domain/repositories/login/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  Future<LoginResponse> execute(String email, String password) {
    return repository.login(email, password);
  }
}
