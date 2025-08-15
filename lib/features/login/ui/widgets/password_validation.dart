import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  final bool? passwordsMatch;
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
    this.passwordsMatch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(hasLowerCase, 'At least one lowercase letter'),
        verticalSpace(2),
        buildValidationRow(hasUpperCase, 'At least one uppercase letter'),
        verticalSpace(2),
        buildValidationRow(
          hasSpecialCharacter,
          'At least one special character',
        ),
        verticalSpace(2),
        buildValidationRow(hasNumber, 'At least one number'),
        verticalSpace(2),
        buildValidationRow(hasMinLength, 'At least eight characters long'),
        if (passwordsMatch != null) ...[
          verticalSpace(2),
          buildValidationRow(passwordsMatch!, 'Passwords match'),
        ],
      ],
    );
  }

  Widget buildValidationRow(bool hasValidated, String text) {
    return Row(
      children: [
        CircleAvatar(backgroundColor: ColorsManager.gray, radius: 2.5),
        horizontalSpace(8),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: ColorsManager.green,
            decorationThickness: 2.0,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
