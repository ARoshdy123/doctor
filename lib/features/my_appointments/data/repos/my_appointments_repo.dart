import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/core/networking/api_result.dart';
import 'package:doctor/features/my_appointments/data/data_sources/my_appointments_api_service.dart';
import 'package:doctor/features/my_appointments/data/models/appointments_list_response_model.dart';

class MyAppointmentsRepo {
  final MyAppointmentsApiService _apiService;
  MyAppointmentsRepo(this._apiService);

  Future<ApiResult<AppointmentsListResponseModel>> getAppointments() async {
    try {
      final response = await _apiService.getAppointments();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
