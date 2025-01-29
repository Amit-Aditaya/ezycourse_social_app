import 'package:ezy_course/core/exceptions/exceptions.dart';
import 'package:ezy_course/domain/use_cases/login/login_use_case.dart';
import 'package:ezy_course/presentation/screens/login/state/bloc/login_event.dart';
import 'package:ezy_course/presentation/screens/login/state/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final response = await loginUseCase.execute(event.email, event.password);
      emit(LoginSuccess(token: response.token));
    } on LoginException catch (e) {
      emit(LoginError(message: e.message));
    } catch (e) {
      emit(LoginError(message: 'An unexpected error occurred'));
    }
  }
}
