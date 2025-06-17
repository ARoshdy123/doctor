import 'package:doctor/features/login/data/models/login_request_body.dart';
import 'package:doctor/features/login/data/repos/login_repo.dart';
import 'package:doctor/features/login/logic/cubit/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    // Emit loading state
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(
      success: (data) {
        // Emit success state with data
        emit(LoginState.success(data));
      },
      failure: (errorHandler) {
        emit(LoginState.error(errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }
}
