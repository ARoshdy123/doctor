import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppointmentTabs extends StatelessWidget {
  const ProfileAppointmentTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.h),
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: ColorsManager.superLightGray2,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _TabItem(label: 'My Appointment', isSelected: true),
          _TabItem(label: 'Medical records', isSelected: false),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _TabItem({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? TextStyles.font13DarkBlueMedium
                : TextStyles.font13GrayRegular,
          ),
        ),
      ),
    );
  }
}
