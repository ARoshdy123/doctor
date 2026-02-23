import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  final String? message;
  final bool? status;
  final int? code;
  @JsonKey(name: 'data')
  final List<ProfileData>? profileData;

  const ProfileResponseModel({
    this.message,
    this.status,
    this.code,
    this.profileData,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable()
class ProfileData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;
  final String? image;

  const ProfileData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.image,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
