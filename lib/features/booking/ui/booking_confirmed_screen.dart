import 'package:doctor/core/helpers/doctor_image_helper.dart';
import 'package:doctor/core/helpers/extensions.dart';
import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/core/widgets/app_text_button.dart';
import 'package:doctor/features/booking/logic/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingConfirmedScreen extends StatelessWidget {
  final AppointmentCubit cubit;

  const BookingConfirmedScreen({super.key, required this.cubit});

  static const String _googleMapsUrl =
      'https://maps.app.goo.gl/mEwoDmHEv13v76tD9';

  Future<void> openGoogleMaps() async {
    final uri = Uri.parse(_googleMapsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final doctor = cubit.doctorData;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Details', style: TextStyles.font18DarkBlueBold),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorsManager.darkBlue),
          onPressed: () => _navigateToAppointments(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(24),

            // ── Green Checkmark ──
            Container(
              width: 80.r,
              height: 80.r,
              decoration: const BoxDecoration(
                color: ColorsManager.green,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 44.r),
            ),
            verticalSpace(16),
            Text('Booking Confirmed', style: TextStyles.font18DarkBlueBold),
            verticalSpace(32),

            // ── Booking Information ──
            _sectionTitle('Booking Information'),
            verticalSpace(12),
            _infoRow(
              icon: Icons.calendar_today_outlined,
              iconColor: ColorsManager.mainBlue,
              title: 'Date & Time',
              value: '${cubit.formattedDate}\n${cubit.selectedTime ?? ''}',
            ),
            verticalSpace(10),
            _infoRowWithAction(
              icon: Icons.medical_services_outlined,
              iconColor: ColorsManager.mainBlue,
              title: 'Appointment Type',
              value: cubit.appointmentTypeLabel,
              actionLabel:
                  cubit.appointmentType == AppointmentType.inPerson
                      ? 'Get Location'
                      : null,
              onActionTap: () {
                openGoogleMaps();
                // TODO: Open maps / location
              },
            ),
            verticalSpace(20),

            // ── Doctor Information ──
            _sectionTitle('Doctor Information'),
            verticalSpace(12),
            Container(
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: ColorsManager.superLightGray2,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      getDoctorImage(doctor?.id),
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor?.name ?? 'Doctor',
                          style: TextStyles.font14DarkBlueBold,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '${doctor?.degree ?? ''} | ${doctor?.specialization?.name ?? ''}',
                          style: TextStyles.font12GrayMedium,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16.r),
                            SizedBox(width: 4.w),
                            Text(
                              '4.8 (4,279 reviews)',
                              style: TextStyles.font12GrayRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(40),
          ],
        ),
      ),
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
          child: AppTextButton(
            buttonText: 'Done',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () => _navigateToAppointments(context),
          ),
        ),
      ),
    );
  }

  void _navigateToAppointments(BuildContext context) {
    context.pushNamedAndRemoveUntil(
      Routes.mainLayout,
      arguments: 2, // Appointments tab index
      predicate: (route) => false,
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextStyles.font15DarkBlueMedium),
    );
  }

  Widget _infoRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorsManager.superLightGray2,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: iconColor, size: 20.r),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.font12GrayMedium),
                SizedBox(height: 2.h),
                Text(value, style: TextStyles.font13DarkBlueMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRowWithAction({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    String? actionLabel,
    VoidCallback? onActionTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorsManager.superLightGray2,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: iconColor, size: 20.r),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.font12GrayMedium),
                SizedBox(height: 2.h),
                Text(value, style: TextStyles.font13DarkBlueMedium),
              ],
            ),
          ),
          if (actionLabel != null)
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: ColorsManager.mainBlue),
                ),
                child: Text(actionLabel, style: TextStyles.font12BlueRegular),
              ),
            ),
        ],
      ),
    );
  }
}
