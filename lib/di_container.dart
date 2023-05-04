import 'package:citraland/data/repository/language_repo.dart';
import 'package:citraland/provider/language_provider.dart';
import 'package:citraland/provider/localization_provider.dart';
import 'package:citraland/provider/theme_provider.dart';
import 'package:citraland/utill/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  // Core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => LanguageRepo());

  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LanguageProvider(languageRepo: sl()));
}
