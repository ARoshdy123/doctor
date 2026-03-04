// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_doctors_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDoctorsResponseModel _$AllDoctorsResponseModelFromJson(
  Map<String, dynamic> json,
) => AllDoctorsResponseModel(
  message: json['message'] as String?,
  doctorDataList:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : DoctorData.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$AllDoctorsResponseModelToJson(
  AllDoctorsResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.doctorDataList,
  'status': instance.status,
  'code': instance.code,
};

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
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
          : SpecializationModel.fromJson(
            json['specialization'] as Map<String, dynamic>,
          ),
  city:
      json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
  appointPrice: (json['appoint_price'] as num?)?.toInt(),
  startTime: json['start_time'] as String?,
  endTime: json['end_time'] as String?,
);

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
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
      'city': instance.city,
      'appoint_price': instance.appointPrice,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

SpecializationModel _$SpecializationModelFromJson(Map<String, dynamic> json) =>
    SpecializationModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpecializationModelToJson(
  SpecializationModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  governrate:
      json['governrate'] == null
          ? null
          : GovernrateModel.fromJson(
            json['governrate'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'governrate': instance.governrate,
};

GovernrateModel _$GovernrateModelFromJson(Map<String, dynamic> json) =>
    GovernrateModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GovernrateModelToJson(GovernrateModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
