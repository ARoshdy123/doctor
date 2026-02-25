import 'dart:io';

import 'package:doctor/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final File? localImage;
  final VoidCallback? onTap;

  const ProfileAvatar({super.key, this.imageUrl, this.localImage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: 90.r,
              height: 90.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE8E4F7),
              ),
              child: ClipOval(child: _buildImage()),
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
      ),
    );
  }

  Widget _buildImage() {
    if (localImage != null) {
      return Image.file(localImage!, fit: BoxFit.cover);
    }
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder:
            (_, __, ___) =>
                const Icon(Icons.person, size: 50, color: ColorsManager.gray),
      );
    }
    return const Icon(Icons.person, size: 50, color: ColorsManager.gray);
  }
}
