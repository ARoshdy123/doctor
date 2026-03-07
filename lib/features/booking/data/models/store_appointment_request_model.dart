import 'package:json_annotation/json_annotation.dart';
part 'store_appointment_request_model.g.dart';

@JsonSerializable()
class AppointmentRequestModel {
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  @JsonKey(name: 'start_time')
  final String startTime;
  final String notes;

  AppointmentRequestModel({
    required this.doctorId,
    required this.startTime,
    required this.notes,
  });

  Map<String, dynamic> toJson() => _$AppointmentRequestModelToJson(this);
}
