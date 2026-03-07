import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_constants.dart';
import 'package:doctor/features/my_appointments/data/models/appointments_list_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'my_appointments_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class MyAppointmentsApiService {
  factory MyAppointmentsApiService(Dio dio) = _MyAppointmentsApiService;

  @GET(ApiConstants.getAppointmentsEndpoint)
  Future<AppointmentsListResponseModel> getAppointments();
}
