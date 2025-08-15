import 'package:dio/dio.dart';
import 'package:doctor/core/networking/dio_factory.dart';
import 'package:doctor/features/login/data/data_sources/login_api_service.dart';
import 'package:doctor/features/login/data/repos/login_repo.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor/features/sign_up/data/data_sources/sign_up_api_service.dart';
import 'package:doctor/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doctor/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  // Register Dio  one instance
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<SignUpApiService>(() => SignUpApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt())); //create noskha whda for all app (dispose will lead crash)
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt())); // kool ma ahtgha create noskha gdeda
  //Register
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
