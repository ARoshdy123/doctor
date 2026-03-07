import 'package:doctor/core/helpers/doctor_image_helper.dart';
import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:doctor/features/explore/ui/widgets/doctor_about_tab.dart';
import 'package:doctor/features/explore/ui/widgets/doctor_location_tab.dart';
import 'package:doctor/features/explore/ui/widgets/doctor_reviews_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailScreen extends StatelessWidget {
  final DoctorData? doctorData;

  const DoctorDetailScreen({super.key, this.doctorData});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            doctorData?.name ?? 'Doctor',
            style: TextStyles.font18DarkBlueBold,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorsManager.darkBlue,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: ColorsManager.darkBlue,
                size: 24.r,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // Doctor header
            _DoctorHeader(doctorData: doctorData),
            verticalSpace(16),

            // Tab bar
            TabBar(
              labelColor: ColorsManager.mainBlue,
              unselectedLabelColor: ColorsManager.gray,
              indicatorColor: ColorsManager.mainBlue,
              indicatorWeight: 3,
              labelStyle: TextStyles.font14DarkBlueBold,
              unselectedLabelStyle: TextStyles.font14GrayRegular,
              tabs: const [
                Tab(text: 'About'),
                Tab(text: 'Location'),
                Tab(text: 'Reviews'),
              ],
            ),

            // Tab views
            Expanded(
              child: TabBarView(
                children: [
                  DoctorAboutTab(doctorData: doctorData),
                  DoctorLocationTab(doctorData: doctorData),
                  const DoctorReviewsTab(),
                ],
              ),
            ),
          ],
        ),

        // Bottom button
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushNamed('/bookAppointment', arguments: doctorData);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.mainBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Make An Appointment',
                  style: TextStyles.font16WhiteSemiBold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DoctorHeader extends StatelessWidget {
  final DoctorData? doctorData;

  const _DoctorHeader({this.doctorData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          // Doctor photo
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              getDoctorImage(doctorData?.id),
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(16),

          // Doctor info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorData?.name ?? 'Doctor',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                Text(
                  '${doctorData?.degree ?? ''} | ${doctorData?.specialization?.name ?? ''}',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(4),
                Text(
                  doctorData?.email ?? '',
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),

          // Chat icon
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: ColorsManager.lightBlue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.chat_bubble_outline,
              color: ColorsManager.mainBlue,
              size: 20.r,
            ),
          ),
        ],
      ),
    );
  }
}
