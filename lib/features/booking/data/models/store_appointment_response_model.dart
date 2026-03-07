import 'package:json_annotation/json_annotation.dart';
part 'store_appointment_response_model.g.dart';

@JsonSerializable()
class AppointmentResponseModel {
  String? message;
  @JsonKey(name: 'data')
  AppointmentData? appointmentData;
  bool? status;
  int? code;

  AppointmentResponseModel({
    this.message,
    this.appointmentData,
    this.status,
    this.code,
  });

  factory AppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseModelFromJson(json);
}

@JsonSerializable()
class AppointmentData {
  int? id;
  @JsonKey(name: 'doctor_id')
  int? doctorId;
  @JsonKey(name: 'patient_id')
  int? patientId;
  @JsonKey(name: 'start_time')
  String? startTime;
  String? notes;
  String? status;

  AppointmentData({
    this.id,
    this.doctorId,
    this.patientId,
    this.startTime,
    this.notes,
    this.status,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDataFromJson(json);
}
