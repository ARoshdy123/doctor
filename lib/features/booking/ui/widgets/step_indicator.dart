import 'package:doctor/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> labels;

  const StepIndicator({
    super.key,
    required this.currentStep,
    this.labels = const ['Date & Time', 'Payment', 'Summary'],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        children: List.generate(labels.length * 2 - 1, (index) {
          if (index.isEven) {
            final stepIndex = index ~/ 2;
            return _buildStepCircle(stepIndex);
          } else {
            final beforeStep = index ~/ 2;
            return _buildConnector(beforeStep);
          }
        }),
      ),
    );
  }

  Widget _buildStepCircle(int stepIndex) {
    final isCompleted = stepIndex < currentStep;
    final isActive = stepIndex == currentStep;
    final circleColor =
        isCompleted
            ? ColorsManager.green
            : isActive
            ? ColorsManager.mainBlue
            : ColorsManager.lighterGray;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32.r,
          height: 32.r,
          decoration: BoxDecoration(shape: BoxShape.circle, color: circleColor),
          child: Center(
            child:
                isCompleted
                    ? Icon(Icons.check, color: Colors.white, size: 18.r)
                    : Text(
                      '${stepIndex + 1}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: isActive ? Colors.white : ColorsManager.gray,
                      ),
                    ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          labels[stepIndex],
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight:
                isActive || isCompleted ? FontWeight.w600 : FontWeight.w400,
            color:
                isCompleted
                    ? ColorsManager.green
                    : isActive
                    ? ColorsManager.mainBlue
                    : ColorsManager.lighterGray,
          ),
        ),
      ],
    );
  }

  Widget _buildConnector(int beforeStep) {
    final isCompleted = beforeStep < currentStep;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: Container(
          height: 3.h,
          color: isCompleted ? ColorsManager.green : ColorsManager.lighterGray,
        ),
      ),
    );
  }
}
