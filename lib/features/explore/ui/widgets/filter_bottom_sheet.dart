import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/explore/logic/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int? _selectedSpecializationId;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ExploreCubit>();
    _selectedSpecializationId = cubit.selectedSpecializationId;
    cubit.loadSpecializations().then((_) {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExploreCubit>();
    final specializations = cubit.specializations;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ColorsManager.lighterGray,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          verticalSpace(16),
          Text('Sort By', style: TextStyles.font18DarkBlueBold),
          verticalSpace(24),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text('Speciality', style: TextStyles.font15DarkBlueMedium),
          ),
          verticalSpace(12),
          _isLoading
              ? SizedBox(
                height: 40.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: ColorsManager.mainBlue,
                  ),
                ),
              )
              : SizedBox(
                height: 40.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specializations.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      final isSelected = _selectedSpecializationId == null;
                      return _buildChip(
                        label: 'All',
                        isSelected: isSelected,
                        onTap:
                            () => setState(
                              () => _selectedSpecializationId = null,
                            ),
                      );
                    }
                    final spec = specializations[index - 1];
                    final isSelected = _selectedSpecializationId == spec?.id;
                    return _buildChip(
                      label: spec?.name ?? '',
                      isSelected: isSelected,
                      onTap:
                          () => setState(
                            () => _selectedSpecializationId = spec?.id,
                          ),
                    );
                  },
                ),
              ),
          verticalSpace(32),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedSpecializationId == null) {
                  cubit.getAllDoctors();
                } else {
                  cubit.filterDoctors(_selectedSpecializationId!);
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.mainBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text('Done', style: TextStyles.font16WhiteSemiBold),
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? ColorsManager.mainBlue : Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color:
                  isSelected
                      ? ColorsManager.mainBlue
                      : ColorsManager.lighterGray,
            ),
          ),
          child: Text(
            label,
            style:
                isSelected
                    ? TextStyles.font14DarkBlueMedium.copyWith(
                      color: Colors.white,
                    )
                    : TextStyles.font14GrayRegular,
          ),
        ),
      ),
    );
  }
}
