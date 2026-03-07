import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/booking/logic/cubit/appointment_cubit.dart';
import 'package:doctor/features/booking/ui/widgets/date_time_step.dart';
import 'package:doctor/features/booking/ui/widgets/payment_step.dart';
import 'package:doctor/features/booking/ui/widgets/step_indicator.dart';
import 'package:doctor/features/booking/ui/widgets/summary_step.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentScreen extends StatefulWidget {
  final DoctorData? doctorData;

  const BookAppointmentScreen({super.key, this.doctorData});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AppointmentCubit>();
    cubit.setDoctorData(widget.doctorData);
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
        context.read<AppointmentCubit>().currentStep = _currentStep;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        context.read<AppointmentCubit>().currentStep = _currentStep;
      });
    }
  }

  void _goToStep(int step) {
    setState(() {
      _currentStep = step;
      context.read<AppointmentCubit>().currentStep = _currentStep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Book Appointment', style: TextStyles.font18DarkBlueBold),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorsManager.darkBlue),
          onPressed: () {
            if (_currentStep > 0) {
              _previousStep();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Column(
        children: [
          StepIndicator(currentStep: _currentStep),
          Expanded(
            child: IndexedStack(
              index: _currentStep,
              children: [
                DateTimeStep(onContinue: _nextStep),
                PaymentStep(onContinue: _nextStep),
                SummaryStep(onChangePayment: () => _goToStep(1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
