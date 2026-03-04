import 'package:doctor/core/di/dependency_injection.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/features/explore/logic/explore_cubit.dart';
import 'package:doctor/features/explore/ui/explore_screen.dart';
import 'package:doctor/features/home/logic/home_cubit.dart';
import 'package:doctor/features/home/ui/home_screen.dart';
import 'package:doctor/features/profile/logic/cubit/logout_cubit.dart';
import 'package:doctor/features/profile/logic/cubit/profile_cubit.dart';
import 'package:doctor/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      const ExploreScreen(),
      const _PlaceholderScreen(label: 'Appointments'),
      ProfileScreen(
        onBack: () => setState(() => _currentIndex = 0),
        onNavigateToAppointments: () => setState(() => _currentIndex = 2),
      ),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>()..getSpecializations(),
        ),
        BlocProvider<ExploreCubit>(
          create: (_) => getIt<ExploreCubit>()..getAllDoctors(),
        ),
        BlocProvider<ProfileCubit>(create: (_) => getIt<ProfileCubit>()),
        BlocProvider<LogoutCubit>(create: (_) => getIt<LogoutCubit>()),
      ],
      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: pages),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.05)),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: GNav(
                rippleColor: ColorsManager.lightBlue,
                hoverColor: ColorsManager.lightBlue,
                gap: 8,
                activeColor: ColorsManager.mainBlue,
                iconSize: 24.r,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: ColorsManager.lightBlue,
                color: ColorsManager.gray,
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() => _currentIndex = index);
                },
                tabs: const [
                  GButton(icon: Icons.home_outlined, text: 'Home'),
                  GButton(icon: Icons.search, text: 'Explore'),
                  GButton(
                    icon: Icons.calendar_today_outlined,
                    text: 'Appointment',
                  ),
                  GButton(icon: Icons.person_outline, text: 'Profile'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String label;

  const _PlaceholderScreen({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(label, style: const TextStyle(fontSize: 18))),
    );
  }
}
