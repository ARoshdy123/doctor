
import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';

class GenderTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const GenderTile({super.key, 
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color:
              selected ? ColorsManager.lightBlue : ColorsManager.superLightGray,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color:
                selected ? ColorsManager.mainBlue : ColorsManager.lighterGray,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: selected ? ColorsManager.mainBlue : ColorsManager.gray,
              size: 24,
            ),
            verticalSpace(6),
            Text(
              label,
              style:
                  selected
                      ? TextStyles.font13BlueSemiBold
                      : TextStyles.font13DarkBlueRegular,
            ),
          ],
        ),
      ),
    );
  }
}
