import 'dart:async';

import 'package:books_api/feature/planet/data/data_sources/local/planets_database.dart';
import 'package:books_api/feature/planet/data/data_sources/remote/planets_api_service.dart';
import 'package:books_api/feature/planet/data/models/planet_model.dart';
import 'package:books_api/feature/planet/data/repository/planet_repository_impl.dart';
import 'package:books_api/feature/planet/domain/repository/planet_repository.dart';
import 'package:books_api/feature/planet/domain/usecase/add_book_local.dart';
import 'package:books_api/feature/planet/domain/usecase/delete_book_local.dart';
import 'package:books_api/feature/planet/domain/usecase/get_books_local.dart';
import 'package:books_api/feature/planet/domain/usecase/get_planets_by_radius.dart';
import 'package:books_api/feature/planet/domain/usecase/get_planets_by_temp.dart';
import 'package:books_api/feature/planet/domain/usecase/get_planets_usecase.dart';
import 'package:books_api/feature/planet/presentation/bloc/local/local_planet_bloc.dart';
import 'package:books_api/feature/planet/presentation/bloc/remote/planet_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final service = GetIt.instance;

Future<void> init() async {
  //Hive
  await Hive.initFlutter();
  Hive.registerAdapter(PlanetModelAdapter());
  service.registerSingleton<HiveInterface>(Hive);

  final Box<PlanetModel> bookBox = await Hive.openBox<PlanetModel>('planets');
  service.registerSingleton<Box<PlanetModel>>(bookBox);

  //Dio
  service.registerSingleton<Dio>(Dio());

  //Dependencies

  service.registerSingleton<PlanetsApiService>(PlanetsApiService(service()));

  service
      .registerSingleton<PlanetsLocalDatabase>(PlanetsLocalDatabase(service()));
  service.registerSingleton<PlanetRepository>(
      PlanetRepositoryImpl(service(), service()));

  //Use case
  service.registerSingleton<GetPlanetsLocalUseCase>(
      GetPlanetsLocalUseCase(service()));
  service.registerSingleton<GetPlanetsUsecase>(GetPlanetsUsecase(service()));
  service.registerSingleton<AddPlanetsLocalUseCase>(
      AddPlanetsLocalUseCase(service()));
  service.registerSingleton<DeletePlanetsLocalUseCase>(
      DeletePlanetsLocalUseCase(service()));
  service.registerSingleton<GetPlanetsByRadiusUsecase>(
      GetPlanetsByRadiusUsecase(service()));
  service.registerSingleton<GetPlanetsByTempUsecase>(
      GetPlanetsByTempUsecase(service()));

  // //Blocs
  service.registerFactory<PlanetsBloc>(
      () => PlanetsBloc(service(), service(), service()));
  service.registerFactory<LocalPlanetBloc>(
      () => LocalPlanetBloc(service(), service(), service()));
}
