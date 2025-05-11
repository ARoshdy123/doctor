import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

// used error model in the dio error handler to parse the error response from the server and used json_serializable to generate the model class
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({required this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
