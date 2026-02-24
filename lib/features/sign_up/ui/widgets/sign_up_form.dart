import 'package:doctor/core/helpers/app_regax.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/login/ui/widgets/password_validation.dart';
import 'package:doctor/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doctor/features/sign_up/ui/widgets/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late final ValueNotifier<bool> isPasswordObscureTextNotifier;
  late final ValueNotifier<bool> isPasswordConfirmationObscureTextNotifier;
  late final ValueNotifier<int> selectedGenderNotifier;

  @override
  void initState() {
    super.initState();
    final signUpCubit = context.read<SignUpCubit>();

    isPasswordObscureTextNotifier = ValueNotifier(true);
    isPasswordConfirmationObscureTextNotifier = ValueNotifier(true);
    selectedGenderNotifier = ValueNotifier(signUpCubit.selectedGender);
  }

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();

    return Form(
      key: signUpCubit.formKey,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Gender', style: TextStyles.font14DarkBlueMedium),
          ),
          verticalSpace(10),
          ValueListenableBuilder<int>(
            valueListenable: selectedGenderNotifier,
            builder: (context, selectedGender, _) {
              return Row(
                children: [
                  Expanded(
                    child: GenderTile(
                      icon: Icons.male,
                      label: 'Male',
                      selected: selectedGender == 0,
                      onTap: () {
                        selectedGenderNotifier.value = 0;
                        signUpCubit.updateGender(0);
                      },
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: GenderTile(
                      icon: Icons.female,
                      label: 'Female',
                      selected: selectedGender == 1,
                      onTap: () {
                        selectedGenderNotifier.value = 1;
                        signUpCubit.updateGender(1);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            labelText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: signUpCubit.nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: signUpCubit.phoneController,
          ),
          verticalSpace(18),
          AppTextFormField(
            labelText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: signUpCubit.emailController,
          ),
          verticalSpace(18),
          ValueListenableBuilder<bool>(
            valueListenable: isPasswordObscureTextNotifier,
            builder: (context, isPasswordObscureText, _) {
              return AppTextFormField(
                controller: signUpCubit.passwordController,
                labelText: 'Password',
                isObscureText: isPasswordObscureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    isPasswordObscureTextNotifier.value =
                        !isPasswordObscureText;
                  },
                  child: Icon(
                    color: ColorsManager.mainBlue,
                    isPasswordObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                },
              );
            },
          ),
          verticalSpace(18),
          ValueListenableBuilder<bool>(
            valueListenable: isPasswordConfirmationObscureTextNotifier,
            builder: (context, isPasswordConfirmationObscureText, _) {
              return AppTextFormField(
                controller: signUpCubit.passwordConfirmationController,
                labelText: 'Password Confirmation',
                isObscureText: isPasswordConfirmationObscureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    isPasswordConfirmationObscureTextNotifier.value =
                        !isPasswordConfirmationObscureText;
                  },
                  child: Icon(
                    color: ColorsManager.mainBlue,
                    isPasswordConfirmationObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                validator: (value) {
                  final password = signUpCubit.passwordController.text;
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  if (value != password) {
                    return "Password doesn't match";
                  }
                },
              );
            },
          ),

          verticalSpace(24),
          AnimatedBuilder(
            animation: Listenable.merge([
              signUpCubit.passwordController,
              signUpCubit.passwordConfirmationController,
            ]),
            builder: (context, _) {
              final password = signUpCubit.passwordController.text;
              final confirmation =
                  signUpCubit.passwordConfirmationController.text;

              return PasswordValidation(
                hasLowerCase: AppRegex.hasLowerCase(password),
                hasUpperCase: AppRegex.hasUpperCase(password),
                hasSpecialCharacter: AppRegex.hasSpecialCharacter(password),
                hasNumber: AppRegex.hasNumber(password),
                hasMinLength: AppRegex.hasMinLength(password),
                passwordsMatch:
                    password.isNotEmpty &&
                    confirmation.isNotEmpty &&
                    password == confirmation,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    isPasswordObscureTextNotifier.dispose();
    isPasswordConfirmationObscureTextNotifier.dispose();
    selectedGenderNotifier.dispose();
    super.dispose();
  }
}
