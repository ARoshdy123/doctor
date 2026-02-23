import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/core/networking/api_result.dart';
import 'package:doctor/features/profile/data/data_sources/profile_api_service.dart';
import 'package:doctor/features/profile/data/models/profile_response_model.dart';

class ProfileRepo {
  final ProfileApiService _profileApiService;

  ProfileRepo(this._profileApiService);

  Future<ApiResult<ProfileResponseModel>> getProfile() async {
    try {
      final response = await _profileApiService.getProfile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<bool>> logout() async {
    try {
      await _profileApiService.logout();
      return const ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
