import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request_body.g.dart';

@JsonSerializable()
class UpdateProfileRequestBody {
  final String name;
  final String email;
  final String phone;
  final String gender;

  UpdateProfileRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyToJson(this);
}
