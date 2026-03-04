import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RecommendationDoctor extends StatelessWidget {
  const RecommendationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Recommendation Doctor', style: TextStyles.font18DarkBlueSemiBold),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text('See All', style: TextStyles.font12BlueRegular),
        ),
      ],
    );
  }
}
