import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_constants.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_response_body.dart';
import 'package:retrofit/retrofit.dart';

import '../models/sign_up_request_body.dart';
part 'sign_up_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio) = _SignUpApiService;

  @POST(ApiConstants.signupEndpoint)
  Future<SignUpResponseBody> signup(
    @Body() SignUpRequestBody signupRequestBody,
  );
}
