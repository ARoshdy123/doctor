import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;
  LoginResponseBody({this.message, this.userData, this.status, this.code});
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;

  @JsonKey(name: 'username')
  String? userName;

  UserData(this.token, this.userName);
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
