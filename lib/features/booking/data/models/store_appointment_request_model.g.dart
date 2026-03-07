// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_appointment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentRequestModel _$AppointmentRequestModelFromJson(
  Map<String, dynamic> json,
) => AppointmentRequestModel(
  doctorId: (json['doctor_id'] as num).toInt(),
  startTime: json['start_time'] as String,
  notes: json['notes'] as String,
);

Map<String, dynamic> _$AppointmentRequestModelToJson(
  AppointmentRequestModel instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'start_time': instance.startTime,
  'notes': instance.notes,
};
