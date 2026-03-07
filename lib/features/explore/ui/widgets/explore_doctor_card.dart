import 'package:doctor/core/helpers/doctor_image_helper.dart';
import 'package:doctor/core/helpers/extensions.dart';
import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class ExploreDoctorCard extends StatelessWidget {
  final DoctorData? doctorData;

  const ExploreDoctorCard({super.key, this.doctorData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.doctorDetail, arguments: doctorData);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsManager.lighterGray, width: 1),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                getDoctorImage(doctorData?.id),
                width: 110.w,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorData?.name ?? 'Name',
                    style: TextStyles.font18DarkBlueBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(5),
                  Text(
                    '${doctorData?.degree ?? ''} | ${doctorData?.specialization?.name ?? ''}',
                    style: TextStyles.font12GrayMedium,
                  ),
                  verticalSpace(5),
                  Text(
                    doctorData?.email ?? '',
                    style: TextStyles.font12GrayMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
