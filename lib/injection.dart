import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test/data/datasources/service.dart';
import 'package:test/domain/repositories/universities_repository.dart';
import 'package:test/domain/usecases/universities_usecase.dart';
import 'package:test/presentation/bloc/universities_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => UniversitiesBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => UniversitiesUseCase(locator()));

  // repository
  locator.registerLazySingleton<UniversitiesRepository>(
    () => UniversitiesRepository(
      client: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RestClient>(
    () => RestClient(
      locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => Dio());
}
