import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_constants.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:doctor/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'explore_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ExploreApiService {
  factory ExploreApiService(Dio dio) = _ExploreApiService;

  @GET(ApiConstants.getDoctorsEndpoint)
  Future<AllDoctorsResponseModel> getAllDoctors();

  @GET(ApiConstants.searchDoctorEndpoint)
  Future<AllDoctorsResponseModel> searchDoctors(@Query('name') String name);

  @GET('doctor/doctor-filter')
  Future<AllDoctorsResponseModel> filterDoctors(
    @Query('specialization') int specializationId,
  );

  @GET('specialization/index')
  Future<SpecializationsResponseModel> getSpecializations();
}
