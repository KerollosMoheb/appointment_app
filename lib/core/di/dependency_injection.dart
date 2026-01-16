import 'package:dio/dio.dart';
import 'package:flutter_complete_project_omar_ahmed/core/networking/api_service.dart';
import 'package:flutter_complete_project_omar_ahmed/core/networking/dio_factory.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/data/repos/sign_up_repo.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit()));

  //SignUp
  getit.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getit()));
  getit.registerFactory<SignUpCubit>(() => SignUpCubit(getit()));
}
