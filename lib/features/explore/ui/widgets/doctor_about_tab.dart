import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorAboutTab extends StatelessWidget {
  final DoctorData? doctorData;

  const DoctorAboutTab({super.key, this.doctorData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About me
          Text('About me', style: TextStyles.font18DarkBlueBold),
          verticalSpace(12),
          Text(
            doctorData?.description ?? 'No description available.',
            style: TextStyles.font14GrayRegular,
          ),
          verticalSpace(24),

          // Working Time
          Text('Working Time', style: TextStyles.font18DarkBlueBold),
          verticalSpace(12),
          Text(
            'Monday - Friday, ${doctorData?.startTime ?? 'N/A'} - ${doctorData?.endTime ?? 'N/A'}',
            style: TextStyles.font14GrayRegular,
          ),
          verticalSpace(24),

          // STR
          Text('STR', style: TextStyles.font18DarkBlueBold),
          verticalSpace(12),
          Text(doctorData?.phone ?? 'N/A', style: TextStyles.font14GrayRegular),
          verticalSpace(24),

          // Pengalaman Praktik
          Text('Pengalaman Praktik', style: TextStyles.font18DarkBlueBold),
          verticalSpace(12),
          Text(
            doctorData?.address ?? 'N/A',
            style: TextStyles.font14GrayRegular,
          ),
          verticalSpace(8),
          Text(doctorData?.degree ?? '', style: TextStyles.font12GrayMedium),
        ],
      ),
    );
  }
}
