import 'package:doctor/core/helpers/doctor_image_helper.dart';
import 'package:doctor/core/helpers/extensions.dart';
import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/specializations_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;

  const DoctorsListViewItem({super.key, this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final doctorData = DoctorData(
          id: doctorsModel?.id,
          name: doctorsModel?.name,
          email: doctorsModel?.email,
          phone: doctorsModel?.phone,
          photo: doctorsModel?.photo,
          gender: doctorsModel?.gender,
          degree: doctorsModel?.degree,
          appointPrice: doctorsModel?.price,
        );
        context.pushNamed(Routes.doctorDetail, arguments: doctorData);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),

              child: Image.asset(
                getDoctorImage(doctorsModel?.id),
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
                    doctorsModel?.name ?? 'Name',
                    style: TextStyles.font18DarkBlueBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(5),
                  Text(
                    '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                    style: TextStyles.font12GrayMedium,
                  ),
                  verticalSpace(5),
                  Text(
                    doctorsModel?.email ?? 'Email',
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
