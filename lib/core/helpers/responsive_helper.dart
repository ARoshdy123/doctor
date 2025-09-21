import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsiveExtension on num {
  // Simple responsive width - automatically bigger on tablets
  double get rw {
    if (ScreenUtil().screenWidth >= 600) {
      return (this * 1.3).w; // 30% bigger on tablets
    }
    return this.w;
  }

  // Simple responsive height - automatically bigger on tablets
  double get rh {
    if (ScreenUtil().screenWidth >= 600) {
      return (this * 1.3).h; // 30% bigger on tablets
    }
    return this.h;
  }

  // Simple responsive font - automatically bigger on tablets
  double get rsp {
    if (ScreenUtil().screenWidth >= 600) {
      return (this * 1.2).sp; // 20% bigger fonts on tablets
    }
    return this.sp;
  }

  // Simple spacing
  SizedBox get vSpace => SizedBox(height: rh);

  SizedBox get hSpace => SizedBox(width: rw);
}

// Simple device check
class Device {
  static bool isTablet(BuildContext context) => ScreenUtil().screenWidth >= 600;

  static bool isMobile(BuildContext context) => ScreenUtil().screenWidth < 600;
}
