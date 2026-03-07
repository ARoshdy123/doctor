// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestBody _$UpdateProfileRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateProfileRequestBody(
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  gender: json['gender'] as String,
);

Map<String, dynamic> _$UpdateProfileRequestBodyToJson(
  UpdateProfileRequestBody instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'gender': instance.gender,
};
