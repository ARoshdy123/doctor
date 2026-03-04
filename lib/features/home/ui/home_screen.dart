import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/features/home/ui/widgets/recommendation_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctors_banner.dart';
import 'widgets/doctors_speciality.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/specializations_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorBanner(),
              verticalSpace(24.h),
              const DoctorSpeciality(),
              verticalSpace(18),
              const Expanded(child: SpecializationsAndDoctorsBlocBuilder()),
            ],
          ),
        ),
      ),
    );
  }
}

const double pi = 3.14;
