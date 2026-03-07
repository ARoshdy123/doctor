import 'package:dio/dio.dart';
import 'package:doctor/core/networking/api_constants.dart';
import 'package:doctor/features/booking/data/models/store_appointment_request_model.dart';
import 'package:doctor/features/booking/data/models/store_appointment_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'appointment_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AppointmentApiService {
  factory AppointmentApiService(Dio dio) = _AppointmentApiService;

  @POST(ApiConstants.makeAppointmentEndpoint)
  Future<AppointmentResponseModel> makeAppointment(
    @Body() AppointmentRequestModel appointmentRequestModel,
  );
}
