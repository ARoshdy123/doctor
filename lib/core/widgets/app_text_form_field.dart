import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final Color? backgroundColor;
  final String labelText;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.labelStyle,
    this.suffixIcon,
    this.isObscureText,
    required this.labelText,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyles.font14LightGrayRegular,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? ColorsManager.superLightGray,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: isObscureText ?? false,

      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
