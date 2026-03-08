class ApiConstants {
  static const String apiBaseUrl = 'https://vcare.integration25.com/api/';
  static const String loginEndpoint = 'auth/login';
  static const String signupEndpoint = 'auth/register';
  static const String logoutEndpoint = "auth/logout";
  static const String userProfileEndpoint = 'user/profile';
  static const String updateProfileEndpoint = 'user/update';
  static const String homeEndpoint = 'home/index';
  static const String getSpecializationEndpoint = 'specialization/index';
  static const String showSpecializationEndpoint = 'specialization/show/1';
  static const String filterSpecializationEndpoint = 'doctor/doctor-filter';
  static const String getDoctorsEndpoint = 'doctor/index';
  static const String searchDoctorEndpoint = 'doctor/doctor-search';
  static const String makeAppointmentEndpoint = 'appointment/store';
  static const String getAppointmentsEndpoint = 'appointment/index';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
