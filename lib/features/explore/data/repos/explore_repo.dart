import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/core/networking/api_result.dart';
import 'package:doctor/features/explore/data/data_sources/explore_api_service.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';

class ExploreRepo {
  final ExploreApiService _exploreApiService;

  ExploreRepo(this._exploreApiService);

  Future<ApiResult<AllDoctorsResponseModel>> getAllDoctors() async {
    try {
      final response = await _exploreApiService.getAllDoctors();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AllDoctorsResponseModel>> searchDoctors(String name) async {
    try {
      final response = await _exploreApiService.searchDoctors(name);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
