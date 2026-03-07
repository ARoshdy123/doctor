import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_appointments_state.freezed.dart';

@freezed
class MyAppointmentsState<T> with _$MyAppointmentsState<T> {
  const factory MyAppointmentsState.initial() = _Initial;
  const factory MyAppointmentsState.loading() = Loading;
  const factory MyAppointmentsState.success(T data) = Success<T>;
  const factory MyAppointmentsState.error(String error) = Error;
}
