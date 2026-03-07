// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_appointment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponseModel _$AppointmentResponseModelFromJson(
  Map<String, dynamic> json,
) => AppointmentResponseModel(
  message: json['message'] as String?,
  appointmentData:
      json['data'] == null
          ? null
          : AppointmentData.fromJson(json['data'] as Map<String, dynamic>),
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$AppointmentResponseModelToJson(
  AppointmentResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.appointmentData,
  'status': instance.status,
  'code': instance.code,
};

AppointmentData _$AppointmentDataFromJson(Map<String, dynamic> json) =>
    AppointmentData(
      id: (json['id'] as num?)?.toInt(),
      doctorId: (json['doctor_id'] as num?)?.toInt(),
      patientId: (json['patient_id'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AppointmentDataToJson(AppointmentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'patient_id': instance.patientId,
      'start_time': instance.startTime,
      'notes': instance.notes,
      'status': instance.status,
    };
