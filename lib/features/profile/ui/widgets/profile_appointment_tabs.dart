import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppointmentTabs extends StatelessWidget {
  final VoidCallback? onAppointmentTap;
  final VoidCallback? onMedicalIdTap;

  const ProfileAppointmentTabs({
    super.key,
    this.onAppointmentTap,
    this.onMedicalIdTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.h),
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: ColorsManager.superLightGray,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _TabItem(label: 'My Appointment', onTap: onAppointmentTap),
          SizedBox(width: 4.w),
          _TabItem(label: 'Medical ID', onTap: onMedicalIdTap),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _TabItem({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(label, style: TextStyles.font13DarkBlueMedium),
          ),
        ),
      ),
    );
  }
}
