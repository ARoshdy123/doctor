import 'package:doctor/features/my_appointments/data/models/appointments_list_response_model.dart';
import 'package:doctor/features/my_appointments/data/repos/my_appointments_repo.dart';
import 'package:doctor/features/my_appointments/logic/cubit/my_appointments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentsCubit extends Cubit<MyAppointmentsState> {
  final MyAppointmentsRepo _repo;
  MyAppointmentsCubit(this._repo) : super(const MyAppointmentsState.initial());

  // Locally cancelled appointments (UI-only dummy flow)
  final List<AppointmentItem> _cancelledItems = [];
  final Set<int> _cancelledIds = {};

  Future<void> getAppointments() async {
    emit(const MyAppointmentsState.loading());
    final result = await _repo.getAppointments();
    result.when(
      success: (data) => emit(MyAppointmentsState.success(data)),
      failure: (err) => emit(
        MyAppointmentsState.error(
          err.apiErrorModel.message ?? 'Something went wrong',
        ),
      ),
    );
  }

  void cancelAppointment(AppointmentItem appointment) {
    if (appointment.id == null) return;
    if (_cancelledIds.contains(appointment.id)) return;
    _cancelledIds.add(appointment.id!);
    _cancelledItems.add(appointment);
    // Re-emit a new model instance so Bloc detects the state change
    final current = state;
    current.whenOrNull(
      success: (data) {
        final refreshed = AppointmentsListResponseModel(
          message: data.message,
          appointments: List<AppointmentItem?>.from(data.appointments ?? []),
          status: data.status,
          code: data.code,
        );
        emit(MyAppointmentsState.success(refreshed));
      },
    );
  }

  bool isCancelled(int id) => _cancelledIds.contains(id);

  List<AppointmentItem> getUpcoming(List<AppointmentItem?> all) {
    return all
        .whereType<AppointmentItem>()
        .where((a) => a.status == 'pending' && !_cancelledIds.contains(a.id))
        .toList();
  }

  List<AppointmentItem> getCompleted(List<AppointmentItem?> all) {
    final real = all
        .whereType<AppointmentItem>()
        .where((a) => a.status == 'completed')
        .toList();
    if (real.isNotEmpty) return real;
    // Return 2 dummy items when no completed appointments in response
    return _dummyCompleted;
  }

  List<AppointmentItem> getCancelled(List<AppointmentItem?> all) {
    return _cancelledItems;
  }

  static final List<AppointmentItem> _dummyCompleted = [
    AppointmentItem(
      id: -1,
      doctor: AppointmentDoctorModel(
        id: 1,
        name: 'Dr. Randy Wigham',
        degree: 'General',
        specialization: AppointmentSpecializationModel(
          id: 1,
          name: 'General Medical Checkup',
        ),
      ),
      appointmentTime: 'Wed, 17 May | 08.30 AM',
      status: 'completed',
      appointmentPrice: 250,
    ),
    AppointmentItem(
      id: -2,
      doctor: AppointmentDoctorModel(
        id: 2,
        name: 'Dr. Jack Sulivan',
        degree: 'General',
        specialization: AppointmentSpecializationModel(
          id: 2,
          name: 'General Medical Checkup',
        ),
      ),
      appointmentTime: 'Wed, 17 May | 08.30 AM',
      status: 'completed',
      appointmentPrice: 300,
    ),
  ];
}
