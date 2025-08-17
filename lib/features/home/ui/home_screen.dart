import 'package:doctor/core/theming/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/doctor_banner.dart';
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
          margin: EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [const HomeTopBar(), const DoctorBanner()],
          ),
        ),
      ),
    );
  }
}
