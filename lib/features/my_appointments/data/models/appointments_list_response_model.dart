import 'package:json_annotation/json_annotation.dart';
part 'appointments_list_response_model.g.dart';

@JsonSerializable()
class AppointmentsListResponseModel {
  String? message;
  @JsonKey(name: 'data')
  List<AppointmentItem?>? appointments;
  bool? status;
  int? code;

  AppointmentsListResponseModel({
    this.message,
    this.appointments,
    this.status,
    this.code,
  });

  factory AppointmentsListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsListResponseModelFromJson(json);
}

@JsonSerializable()
class AppointmentItem {
  int? id;
  AppointmentDoctorModel? doctor;
  AppointmentPatientModel? patient;
  @JsonKey(name: 'appointment_time')
  String? appointmentTime;
  @JsonKey(name: 'appointment_end_time')
  String? appointmentEndTime;
  String? status;
  String? notes;
  @JsonKey(name: 'appointment_price')
  int? appointmentPrice;

  AppointmentItem({
    this.id,
    this.doctor,
    this.patient,
    this.appointmentTime,
    this.appointmentEndTime,
    this.status,
    this.notes,
    this.appointmentPrice,
  });

  factory AppointmentItem.fromJson(Map<String, dynamic> json) =>
      _$AppointmentItemFromJson(json);
}

@JsonSerializable()
class AppointmentDoctorModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  AppointmentSpecializationModel? specialization;
  @JsonKey(name: 'appoint_price')
  int? appointPrice;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;

  AppointmentDoctorModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory AppointmentDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDoctorModelFromJson(json);
}

@JsonSerializable()
class AppointmentPatientModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  AppointmentPatientModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  factory AppointmentPatientModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentPatientModelFromJson(json);
}

@JsonSerializable()
class AppointmentSpecializationModel {
  int? id;
  String? name;

  AppointmentSpecializationModel({this.id, this.name});

  factory AppointmentSpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentSpecializationModelFromJson(json);
}
