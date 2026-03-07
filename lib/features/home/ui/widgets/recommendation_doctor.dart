import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/main_layout/logic/main_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationDoctor extends StatelessWidget {
  const RecommendationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Recommendation Doctor', style: TextStyles.font18DarkBlueSemiBold),
        const Spacer(),
        GestureDetector(
          onTap: () => context.read<MainLayoutCubit>().goToTab(1),
          child: Text('See All', style: TextStyles.font12BlueRegular),
        ),
      ],
    );
  }
}
