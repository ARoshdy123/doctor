import 'package:doctor/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;

  const ProfileAvatar({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 90.r,
            height: 90.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE8E4F7),
            ),
            child: ClipOval(
              child: imageUrl != null && imageUrl!.isNotEmpty
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.person,
                        size: 50,
                        color: ColorsManager.gray,
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      size: 50,
                      color: ColorsManager.gray,
                    ),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 26.r,
              height: 26.r,
              decoration: BoxDecoration(
                color: ColorsManager.mainBlue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.edit, color: Colors.white, size: 13),
            ),
          ),
        ],
      ),
    );
  }
}
