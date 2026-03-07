import 'package:doctor/features/booking/data/models/store_appointment_request_model.dart';
import 'package:doctor/features/booking/data/repos/appointment_repo.dart';
import 'package:doctor/features/booking/logic/cubit/appointment_state.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

enum AppointmentType { inPerson, phoneCall }

enum PaymentMethod { creditCard, tabby, tamara, masterCard, cash }

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo _appointmentRepo;
  AppointmentCubit(this._appointmentRepo)
    : super(const AppointmentState.initial());

  // Local UI state
  int currentStep = 0;
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  AppointmentType appointmentType = AppointmentType.inPerson;
  PaymentMethod paymentMethod = PaymentMethod.creditCard;
  final TextEditingController notesController = TextEditingController();

  DoctorData? doctorData;

  void setDoctorData(DoctorData? data) {
    doctorData = data;
  }

  String get formattedDate {
    return DateFormat('EEEE, dd MMMM yyyy').format(selectedDate);
  }

  String get formattedDateShort {
    return DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  String get appointmentTypeLabel {
    switch (appointmentType) {
      case AppointmentType.inPerson:
        return 'In Person';
      case AppointmentType.phoneCall:
        return 'Phone Call';
    }
  }

  String get paymentMethodLabel {
    switch (paymentMethod) {
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.tabby:
        return 'Tabby';
      case PaymentMethod.tamara:
        return 'Tamara';
      case PaymentMethod.masterCard:
        return 'Master Card';
      case PaymentMethod.cash:
        return 'Cash';
    }
  }

  Future<void> bookAppointment() async {
    if (doctorData?.id == null || selectedTime == null) return;

    emit(const AppointmentState.loading());

    final startTime = '$formattedDateShort $selectedTime';

    final response = await _appointmentRepo.makeAppointment(
      AppointmentRequestModel(
        doctorId: doctorData!.id!,
        startTime: startTime,
        notes: notesController.text,
      ),
    );

    response.when(
      success: (data) => emit(AppointmentState.success(data)),
      failure: (errorHandler) {
        emit(
          AppointmentState.error(
            errorHandler.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    notesController.dispose();
    return super.close();
  }
}
