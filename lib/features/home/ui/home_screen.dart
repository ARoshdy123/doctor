import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/features/home/logic/home_cubit.dart';
import 'package:doctor/features/home/logic/home_state.dart';
import 'package:doctor/features/home/ui/widgets/doctor_speciality.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctor_banner.dart';
import 'widgets/doctor_speciality_list.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(10, 16, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const HomeTopBar(),
              const DoctorBanner(),
              verticalSpace(24.h),
              const DoctorSpeciality(),
              verticalSpace(16.h),
              const DoctorSpecialityList(),
              verticalSpace(23.h),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen:
                    (previous, current) =>
                        current is SpecializationsLoading ||
                        current is SpecializationsSuccess ||
                        current is SpecializationsError,
                builder: (context, state) {
                  return state.maybeWhen(
                    specializationsLoading: () {
                      return const SizedBox(
                        height: 100,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    specializationsSuccess: (specializationsResponseModel) {
                      var specializationsList =
                          specializationsResponseModel.specializationDataList;
                      return Expanded(
                        child: Column(
                          children: [
                            DoctorSpecialityList(),
                            verticalSpace(8),
                            const DoctorSpeciality(),
                          ],
                        ),
                      );
                    },
                    specializationsError: (errorHandler) {
                      return const SizedBox.shrink();
                      // return Center(
                      //   child: Text(
                      //     errorHandler.,
                      //     style: TextStyle(color: ColorsManager.red),
                      //   ),
                      // );
                    },
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
              // const DoctorsListViewItem(),
              verticalSpace(12.h),
              const DoctorSpecialityList(),
            ],
          ),
        ),
      ),
    );
  }
}