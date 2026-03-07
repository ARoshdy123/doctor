import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorLocationTab extends StatelessWidget {
  final DoctorData? doctorData;

  const DoctorLocationTab({super.key, this.doctorData});

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
    final cityName = doctorData?.city?.name ?? '';
    final governrateName = doctorData?.city?.governrate?.name ?? '';
    final locationText = [
      cityName,
      governrateName,
    ].where((e) => e.isNotEmpty).join(', ');

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Practice Place
          Text('Practice Place', style: TextStyles.font18DarkBlueBold),
          verticalSpace(12),
          Text(
            locationText.isNotEmpty ? locationText : 'N/A',
            style: TextStyles.font14GrayRegular,
          ),
          verticalSpace(24),

          // Location Map
          Text('Location Map', style: TextStyles.font18DarkBlueBold),
          verticalSpace(12),

          // Tappable map placeholder
          GestureDetector(
            onTap: openGoogleMaps,
            child: Container(
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: ColorsManager.superLightGray2,
                border: Border.all(color: ColorsManager.lighterGray, width: 1),
              ),
              child: Stack(
                children: [
                  // Background grid lines to simulate map
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CustomPaint(
                      size: Size(double.infinity, 200.h),
                      painter: _MapGridPainter(),
                    ),
                  ),
                  // Pin icon in center
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, color: Colors.red, size: 40.r),
                        verticalSpace(4),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            'Tap to open in Google Maps',
                            style: TextStyles.font12GrayMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.withOpacity(0.15)
          ..strokeWidth = 1;

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += 20) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    // Draw vertical lines
    for (double x = 0; x < size.width; x += 20) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw a few diagonal "road" lines
    final roadPaint =
        Paint()
          ..color = ColorsManager.mainBlue.withOpacity(0.2)
          ..strokeWidth = 2.5;

    canvas.drawLine(
      Offset(0, size.height * 0.6),
      Offset(size.width * 0.5, size.height * 0.3),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.3),
      Offset(size.width, size.height * 0.5),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, 0),
      Offset(size.width * 0.4, size.height),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
