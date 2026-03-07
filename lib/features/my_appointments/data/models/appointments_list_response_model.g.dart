// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentsListResponseModel _$AppointmentsListResponseModelFromJson(
  Map<String, dynamic> json,
) => AppointmentsListResponseModel(
  message: json['message'] as String?,
  appointments:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : AppointmentItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$AppointmentsListResponseModelToJson(
  AppointmentsListResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.appointments,
  'status': instance.status,
  'code': instance.code,
};

AppointmentItem _$AppointmentItemFromJson(Map<String, dynamic> json) =>
    AppointmentItem(
      id: (json['id'] as num?)?.toInt(),
      doctor:
          json['doctor'] == null
              ? null
              : AppointmentDoctorModel.fromJson(
                json['doctor'] as Map<String, dynamic>,
              ),
      patient:
          json['patient'] == null
              ? null
              : AppointmentPatientModel.fromJson(
                json['patient'] as Map<String, dynamic>,
              ),
      appointmentTime: json['appointment_time'] as String?,
      appointmentEndTime: json['appointment_end_time'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      appointmentPrice: (json['appointment_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AppointmentItemToJson(AppointmentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'patient': instance.patient,
      'appointment_time': instance.appointmentTime,
      'appointment_end_time': instance.appointmentEndTime,
      'status': instance.status,
      'notes': instance.notes,
      'appointment_price': instance.appointmentPrice,
    };

AppointmentDoctorModel _$AppointmentDoctorModelFromJson(
  Map<String, dynamic> json,
) => AppointmentDoctorModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  gender: json['gender'] as String?,
  address: json['address'] as String?,
  description: json['description'] as String?,
  degree: json['degree'] as String?,
  specialization:
      json['specialization'] == null
          ? null
          : AppointmentSpecializationModel.fromJson(
            json['specialization'] as Map<String, dynamic>,
          ),
  appointPrice: (json['appoint_price'] as num?)?.toInt(),
  startTime: json['start_time'] as String?,
  endTime: json['end_time'] as String?,
);

Map<String, dynamic> _$AppointmentDoctorModelToJson(
  AppointmentDoctorModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'photo': instance.photo,
  'gender': instance.gender,
  'address': instance.address,
  'description': instance.description,
  'degree': instance.degree,
  'specialization': instance.specialization,
  'appoint_price': instance.appointPrice,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
};

AppointmentPatientModel _$AppointmentPatientModelFromJson(
  Map<String, dynamic> json,
) => AppointmentPatientModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$AppointmentPatientModelToJson(
  AppointmentPatientModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'gender': instance.gender,
};

AppointmentSpecializationModel _$AppointmentSpecializationModelFromJson(
  Map<String, dynamic> json,
) => AppointmentSpecializationModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$AppointmentSpecializationModelToJson(
  AppointmentSpecializationModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
