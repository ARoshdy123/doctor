import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_constants.dart';
import 'package:doctor/features/profile/data/models/profile_response_model.dart';
import 'package:doctor/features/profile/data/models/update_profile_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @GET(ApiConstants.userProfileEndpoint)
  Future<ProfileResponseModel> getProfile();

  @POST(ApiConstants.updateProfileEndpoint)
  Future<ProfileResponseModel> updateProfile(
    @Body() UpdateProfileRequestBody body,
  );

  @POST(ApiConstants.logoutEndpoint)
  Future<void> logout();
}
