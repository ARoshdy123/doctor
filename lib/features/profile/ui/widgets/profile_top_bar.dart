import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ProfileTopBar extends StatelessWidget {
  final VoidCallback? onBack;

  const ProfileTopBar({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Spacer(),
          Text('Profile', style: TextStyles.font18WhiteMedium),
          const Spacer(),
          const Icon(Icons.settings_outlined, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
