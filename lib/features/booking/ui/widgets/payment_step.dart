import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/core/widgets/app_text_button.dart';
import 'package:doctor/features/booking/logic/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentStep extends StatefulWidget {
  final VoidCallback onContinue;
  const PaymentStep({super.key, required this.onContinue});

  @override
  State<PaymentStep> createState() => _PaymentStepState();
}

class _PaymentStepState extends State<PaymentStep> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppointmentCubit>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(8),
          Text('Payment Option', style: TextStyles.font15DarkBlueMedium),
          verticalSpace(16),

          _paymentOption(
            cubit,
            icon: Icons.credit_card,
            iconColor: ColorsManager.mainBlue,
            label: 'Credit Card',
            method: PaymentMethod.creditCard,
          ),
          verticalSpace(10),
          _paymentOption(
            cubit,
            icon: Icons.tab_rounded,
            iconColor: const Color(0xFF3FCEA5),
            label: 'Tabby',
            subtitle: 'Pay in 4 interest-free payments',
            method: PaymentMethod.tabby,
          ),
          verticalSpace(10),
          _paymentOption(
            cubit,
            icon: Icons.account_balance_wallet_outlined,
            iconColor: const Color(0xFFFF6B6B),
            label: 'Tamara',
            subtitle: 'Split in 3 payments, no fees',
            method: PaymentMethod.tamara,
          ),
          verticalSpace(10),
          _paymentOption(
            cubit,
            icon: Icons.credit_card,
            iconColor: const Color(0xFFEB001B),
            label: 'Master Card',
            method: PaymentMethod.masterCard,
          ),
          verticalSpace(10),
          _paymentOption(
            cubit,
            icon: Icons.money,
            iconColor: ColorsManager.green,
            label: 'Cash',
            subtitle: 'Pay at the clinic',
            method: PaymentMethod.cash,
          ),
          verticalSpace(32),

          AppTextButton(
            buttonText: 'Continue',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: widget.onContinue,
          ),
          verticalSpace(16),
        ],
      ),
    );
  }

  Widget _paymentOption(
    AppointmentCubit cubit, {
    required IconData icon,
    required Color iconColor,
    required String label,
    String? subtitle,
    required PaymentMethod method,
  }) {
    final isSelected = cubit.paymentMethod == method;

    return GestureDetector(
      onTap: () {
        setState(() {
          cubit.paymentMethod = method;
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
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: iconColor, size: 22.r),
            ),
            horizontalSpace(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyles.font14DarkBlueMedium.copyWith(
                      color:
                          isSelected
                              ? ColorsManager.darkBlue
                              : ColorsManager.gray,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2.h),
                    Text(subtitle, style: TextStyles.font12GrayRegular),
                  ],
                ],
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
