import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/core/networking/api_result.dart';
import 'package:doctor/features/sign_up/data/data_sources/sign_up_api_service.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_response_body.dart';

class SignUpRepo {
  final SignUpApiService _signUpApiService;

  SignUpRepo(this._signUpApiService);

  Future<ApiResult<SignUpResponseBody>> signup(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await _signUpApiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
