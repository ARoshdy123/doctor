import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileNameAndEmail extends StatelessWidget {
  final String? name;
  final String? email;

  const ProfileNameAndEmail({super.key, this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name ?? 'User',
          style: TextStyles.font18DarkBlueBold,
        ),
        SizedBox(height: 4.h),
        Text(
          email ?? '',
          style: TextStyles.font12GrayRegular,
        ),
      ],
    );
  }
}
