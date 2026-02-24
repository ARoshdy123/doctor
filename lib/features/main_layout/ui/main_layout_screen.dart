import 'package:doctor/core/di/dependency_injection.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/features/home/logic/home_cubit.dart';
import 'package:doctor/features/home/ui/home_screen.dart';
import 'package:doctor/features/profile/logic/cubit/logout_cubit.dart';
import 'package:doctor/features/profile/logic/cubit/profile_cubit.dart';
import 'package:doctor/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      const _PlaceholderScreen(label: 'Messages'),
      const _PlaceholderScreen(label: 'Explore'),
      const _PlaceholderScreen(label: 'Appointments'),
      ProfileScreen(
        onBack: () => setState(() => _currentIndex = 0),
      ),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>()..getSpecializations(),
        ),
        BlocProvider<ProfileCubit>(
          create: (_) => getIt<ProfileCubit>(),
        ),
        BlocProvider<LogoutCubit>(
          create: (_) => getIt<LogoutCubit>(),
        ),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _currentIndex = 2),
          backgroundColor: ColorsManager.mainBlue,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: const Icon(Icons.search, color: Colors.white, size: 28),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              index: 0,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            _NavItemWithBadge(
              icon: Icons.chat_bubble_outline,
              selectedIcon: Icons.chat_bubble,
              index: 1,
              currentIndex: currentIndex,
              badgeCount: 2,
              onTap: onTap,
            ),
            // Space for the FAB
            SizedBox(width: 56.w),
            _NavItem(
              icon: Icons.calendar_today_outlined,
              selectedIcon: Icons.calendar_today,
              index: 3,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            _NavItemAvatar(
              index: 4,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 48.w,
        child: Icon(
          isSelected ? selectedIcon : icon,
          color: isSelected ? ColorsManager.mainBlue : ColorsManager.gray,
          size: 26.r,
        ),
      ),
    );
  }
}

class _NavItemWithBadge extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final int index;
  final int currentIndex;
  final int badgeCount;
  final ValueChanged<int> onTap;

  const _NavItemWithBadge({
    required this.icon,
    required this.selectedIcon,
    required this.index,
    required this.currentIndex,
    required this.badgeCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 48.w,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              color: isSelected ? ColorsManager.mainBlue : ColorsManager.gray,
              size: 26.r,
            ),
            Positioned(
              top: -4,
              right: 2,
              child: Container(
                width: 16.r,
                height: 16.r,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$badgeCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItemAvatar extends StatelessWidget {
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavItemAvatar({
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 48.w,
        child: CircleAvatar(
          radius: 14.r,
          backgroundColor: isSelected
              ? ColorsManager.mainBlue
              : ColorsManager.superLightGray2,
          child: Icon(
            Icons.person,
            size: 18.r,
            color: isSelected ? Colors.white : ColorsManager.gray,
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
      body: Center(
        child: Text(label, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
