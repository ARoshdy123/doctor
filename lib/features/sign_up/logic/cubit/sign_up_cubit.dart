import 'package:bloc/bloc.dart';
import 'package:doctor/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter/widgets.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SignUpRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(const SignupState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: '0',
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (error) {
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
