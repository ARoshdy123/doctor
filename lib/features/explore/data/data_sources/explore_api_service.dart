import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_constants.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'explore_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ExploreApiService {
  factory ExploreApiService(Dio dio) = _ExploreApiService;

  @GET('doctor/index')
  Future<AllDoctorsResponseModel> getAllDoctors();

  @GET('doctor/doctor-search')
  Future<AllDoctorsResponseModel> searchDoctors(@Query('name') String name);
}
