import 'package:cach_van/core/services/api_service.dart';
import 'package:cach_van/features/auth/data/repo/auth_repo_impl.dart';
import 'package:cach_van/features/auth/domain/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(apiService: getIt<ApiService>()));
}
