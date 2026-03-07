import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/features/booking/logic/cubit/appointment_cubit.dart';
import 'package:doctor/features/booking/logic/cubit/appointment_state.dart';
import 'package:doctor/features/booking/ui/widgets/date_time_step.dart';
import 'package:doctor/features/my_appointments/data/models/appointments_list_response_model.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RescheduleScreen extends StatefulWidget {
  final AppointmentItem appointment;

  const RescheduleScreen({super.key, required this.appointment});

  @override
  State<RescheduleScreen> createState() => _RescheduleScreenState();
}

class _RescheduleScreenState extends State<RescheduleScreen> {
  @override
  void initState() {
    super.initState();
    // Set doctor data on the cubit from the appointment item
    final doc = widget.appointment.doctor;
    context.read<AppointmentCubit>().setDoctorData(
      DoctorData(id: doc?.id, name: doc?.name, degree: doc?.degree),
    );
  }

  void _reschedule() {
    final cubit = context.read<AppointmentCubit>();
    if (cubit.selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a time slot')),
      );
      return;
    }
    cubit.bookAppointment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Reschedule', style: TextStyles.font18DarkBlueBold),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorsManager.darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) {
              final cubit = context.read<AppointmentCubit>();
              Navigator.pushReplacementNamed(
                context,
                Routes.rescheduledConfirmed,
                arguments: cubit,
              );
            },
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
          );
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: DateTimeStep(
                      onContinue: _reschedule,
                      buttonLabel: 'Reschedule',
                    ),
                  ),
                ],
              ),
              if (state.maybeWhen(loading: () => true, orElse: () => false))
                const ColoredBox(
                  color: Colors.black26,
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
