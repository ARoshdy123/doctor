import 'package:dio/dio.dart';
import 'package:doctor/core/networking/dio_factory.dart';
import 'package:doctor/features/login/data/data_sources/login_api_service.dart';
import 'package:doctor/features/login/data/repos/login_repo.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  // Register Dio  one instance
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  //Home
}
