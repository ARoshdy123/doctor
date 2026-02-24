import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor/features/sign_up/data/repo/sign_up_repo.dart';
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

  // 0 = male, 1 = female
  int selectedGender = 0;

  void updateGender(int gender) {
    selectedGender = gender;
  }

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());

    final response = await _signupRepo.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: selectedGender.toString(),
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
