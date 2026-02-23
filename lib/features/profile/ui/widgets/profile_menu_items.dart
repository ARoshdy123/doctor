import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuItems extends StatelessWidget {
  final VoidCallback? onLogout;

  const ProfileMenuItems({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProfileMenuItem(
          iconData: Icons.badge_outlined,
          label: 'Personal Information',
          iconBgColor: Color(0xFFEAF2FF),
          iconColor: Color(0xFF247CFF),
        ),
        const Divider(height: 1, indent: 16, endIndent: 16),
        const _ProfileMenuItem(
          iconData: Icons.science_outlined,
          label: 'My Test & Diagnostic',
          iconBgColor: Color(0xFFE8F5E9),
          iconColor: Color(0xFF2ECC71),
        ),
        const Divider(height: 1, indent: 16, endIndent: 16),
        const _ProfileMenuItem(
          iconData: Icons.payment_outlined,
          label: 'Payment',
          iconBgColor: Color(0xFFFFEBEE),
          iconColor: Color(0xFFE57373),
        ),
        const Divider(height: 1, indent: 16, endIndent: 16),
        _ProfileMenuItem(
          iconData: Icons.logout,
          label: 'Logout',
          iconBgColor: const Color(0xFFFFEBEE),
          iconColor: Colors.red,
          labelColor: Colors.red,
          onTap: onLogout,
        ),
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color iconBgColor;
  final Color iconColor;
  final Color? labelColor;
  final VoidCallback? onTap;

  const _ProfileMenuItem({
    required this.iconData,
    required this.label,
    required this.iconBgColor,
    required this.iconColor,
    this.labelColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(iconData, color: iconColor, size: 22.r),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                label,
                style: (TextStyles.font14DarkBlueMedium).copyWith(
                  color: labelColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: labelColor ?? Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
