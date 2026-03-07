import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/core/widgets/app_text_button.dart';
import 'package:doctor/features/booking/logic/cubit/appointment_cubit.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeStep extends StatefulWidget {
  final VoidCallback onContinue;
  final String buttonLabel;
  const DateTimeStep({
    super.key,
    required this.onContinue,
    this.buttonLabel = 'Continue',
  });

  @override
  State<DateTimeStep> createState() => _DateTimeStepState();
}

class _DateTimeStepState extends State<DateTimeStep> {
  static const List<String> _timeSlots = [
    '08:00 AM',
    '08:30 AM',
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentCubit>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(8),
          // ── Select Date ──
          Text('Select Date', style: TextStyles.font15DarkBlueMedium),
          verticalSpace(12),
          _buildDateTimeline(cubit),
          verticalSpace(20),

          // ── Available Time ──
          Text('Available Time', style: TextStyles.font15DarkBlueMedium),
          verticalSpace(12),
          _buildTimeGrid(cubit),
          verticalSpace(20),

          // ── Appointment Type ──
          Text('Appointment Type', style: TextStyles.font15DarkBlueMedium),
          verticalSpace(8),
          _buildAppointmentType(cubit),
          verticalSpace(24),

          // ── Continue / Reschedule Button ──
          AppTextButton(
            buttonText: widget.buttonLabel,
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {
              if (cubit.selectedTime == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a time slot')),
                );
                return;
              }
              widget.onContinue();
            },
          ),
          verticalSpace(16),
        ],
      ),
    );
  }

  Widget _buildDateTimeline(AppointmentCubit cubit) {
    return EasyDateTimeLine(
      initialDate: cubit.selectedDate,
      onDateChange: (date) {
        setState(() {
          cubit.selectedDate = date;
        });
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.dropDown,
        dateFormatter: DateFormatter.fullDateDMY(),
      ),
      dayProps: EasyDayProps(
        height: 76.h,
        width: 58.w,
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            color: ColorsManager.mainBlue,
            borderRadius: BorderRadius.circular(12.r),
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          dayNumStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        inactiveDayStyle: DayStyle(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: ColorsManager.lighterGray),
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.gray,
          ),
          dayNumStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.darkBlue,
          ),
        ),
        todayStyle: DayStyle(
          decoration: BoxDecoration(
            color: ColorsManager.lightBlue,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: ColorsManager.mainBlue),
          ),
          dayStrStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.mainBlue,
          ),
          dayNumStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.mainBlue,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeGrid(AppointmentCubit cubit) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 2.6,
      ),
      itemCount: _timeSlots.length,
      itemBuilder: (context, index) {
        final time = _timeSlots[index];
        final isSelected = cubit.selectedTime == time;

        return GestureDetector(
          onTap: () {
            setState(() {
              cubit.selectedTime = time;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? ColorsManager.mainBlue : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color:
                    isSelected
                        ? ColorsManager.mainBlue
                        : ColorsManager.lighterGray,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              time,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : ColorsManager.darkBlue,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppointmentType(AppointmentCubit cubit) {
    return Column(
      children: [
        _appointmentTypeOption(
          cubit,
          icon: Icons.people_outline,
          label: 'In Person',
          type: AppointmentType.inPerson,
        ),
        verticalSpace(8),
        _appointmentTypeOption(
          cubit,
          icon: Icons.phone_outlined,
          label: 'Phone Call',
          type: AppointmentType.phoneCall,
        ),
      ],
    );
  }

  Widget _appointmentTypeOption(
    AppointmentCubit cubit, {
    required IconData icon,
    required String label,
    required AppointmentType type,
  }) {
    final isSelected = cubit.appointmentType == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          cubit.appointmentType = type;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color:
                isSelected ? ColorsManager.mainBlue : ColorsManager.lighterGray,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? ColorsManager.mainBlue : ColorsManager.gray,
              size: 22.r,
            ),
            horizontalSpace(12),
            Expanded(
              child: Text(
                label,
                style: TextStyles.font14DarkBlueMedium.copyWith(
                  color:
                      isSelected ? ColorsManager.darkBlue : ColorsManager.gray,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color:
                  isSelected ? ColorsManager.mainBlue : ColorsManager.lightGray,
              size: 22.r,
            ),
          ],
        ),
      ),
    );
  }
}
