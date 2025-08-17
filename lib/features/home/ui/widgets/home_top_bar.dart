import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Back, Ahmed!', style: TextStyles.font18DarkBlueBold),
            Text('How are you today?', style: TextStyles.font12GrayRegular),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: ColorsManager.superLightGray2,
          child: SvgPicture.asset('assets/svgs/notifications.svg'),
        ),
      ],
    );
  }
}
