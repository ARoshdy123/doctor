import 'package:json_annotation/json_annotation.dart';

part 'all_doctors_response_model.g.dart';

@JsonSerializable()
class AllDoctorsResponseModel {
  String? message;
  @JsonKey(name: 'data')
  List<DoctorData?>? doctorDataList;
  bool? status;
  int? code;

  AllDoctorsResponseModel({
    this.message,
    this.doctorDataList,
    this.status,
    this.code,
  });

  factory AllDoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsResponseModelFromJson(json);
}

@JsonSerializable()
class DoctorData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  SpecializationModel? specialization;
  CityModel? city;
  @JsonKey(name: 'appoint_price')
  int? appointPrice;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;

  DoctorData({
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
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataFromJson(json);
}

@JsonSerializable()
class SpecializationModel {
  int? id;
  String? name;

  SpecializationModel({this.id, this.name});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);
}

@JsonSerializable()
class CityModel {
  int? id;
  String? name;
  GovernrateModel? governrate;

  CityModel({this.id, this.name, this.governrate});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}

@JsonSerializable()
class GovernrateModel {
  int? id;
  String? name;

  GovernrateModel({this.id, this.name});

  factory GovernrateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernrateModelFromJson(json);
}
