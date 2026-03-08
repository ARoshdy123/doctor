import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/explore/logic/explore_cubit.dart';
import 'package:doctor/features/explore/ui/widgets/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreSearchBar extends StatelessWidget {
  const ExploreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {
              context.read<ExploreCubit>().searchDoctors(value);
            },
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyles.font14LightGrayRegular,
              prefixIcon: Icon(
                Icons.search,
                color: ColorsManager.gray,
                size: 22.r,
              ),
              filled: true,
              fillColor: ColorsManager.superLightGray,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                  color: ColorsManager.lighterGray,
                  width: 1.3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                  color: ColorsManager.mainBlue,
                  width: 1.3,
                ),
              ),
            ),
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder:
                  (_) => BlocProvider.value(
                    value: context.read<ExploreCubit>(),
                    child: const FilterBottomSheet(),
                  ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: ColorsManager.superLightGray,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: ColorsManager.lighterGray, width: 1.3),
            ),
            child: Icon(Icons.tune, color: ColorsManager.gray, size: 22.r),
          ),
        ),
      ],
    );
  }
}
