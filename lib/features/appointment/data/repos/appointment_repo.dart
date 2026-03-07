import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/core/networking/api_result.dart';
import 'package:doctor/features/booking/data/data_sources/booking_api_service.dart';
import 'package:doctor/features/booking/data/models/store_appointment_request_model.dart';
import 'package:doctor/features/booking/data/models/store_appointment_response_model.dart';

class AppointmentRepo {
  final AppointmentApiService _appointmentApiService;
  AppointmentRepo(this._appointmentApiService);

  Future<ApiResult<AppointmentResponseModel>> makeAppointment(
    AppointmentRequestModel appointmentRequestModel,
  ) async {
    try {
      final response = await _appointmentApiService.makeAppointment(
        appointmentRequestModel,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
