// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => ProfileResponseModel(
  message: json['message'] as String?,
  status: json['status'] as bool?,
  code: (json['code'] as num?)?.toInt(),
  profileData:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProfileData.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ProfileResponseModelToJson(
  ProfileResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'code': instance.code,
  'data': instance.profileData?.map((e) => e.toJson()).toList(),
};

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'image': instance.image,
    };
