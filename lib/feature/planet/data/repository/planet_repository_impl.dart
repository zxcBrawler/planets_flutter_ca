import 'dart:io';

import 'package:books_api/core/resources/data_state.dart';
import 'package:books_api/feature/planet/data/data_sources/local/planets_database.dart';
import 'package:books_api/feature/planet/data/data_sources/remote/planets_api_service.dart';
import 'package:books_api/feature/planet/data/models/planet_model.dart';
import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:books_api/feature/planet/domain/repository/planet_repository.dart';
import 'package:dio/dio.dart';

class PlanetRepositoryImpl implements PlanetRepository {
  final PlanetsApiService _planetsApiService;
  final PlanetsLocalDatabase _planetsLocalDatabase;

  PlanetRepositoryImpl(this._planetsApiService, this._planetsLocalDatabase);
  @override
  Future<DataState<List<PlanetEntity>>> getPlanets() async {
    try {
      final httpResponse = await _planetsApiService.getPlanets();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<PlanetEntity>>> getPlanetsByMinRadius() async {
    try {
      final httpResponse = await _planetsApiService.getPlanetsWithMinRadius();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<PlanetEntity>>> getPlanetsByMinTemp() async {
    try {
      final httpResponse = await _planetsApiService.getPlanetsWithMinTemp();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> deletePlanet(PlanetEntity planetEntity) async {
    return _planetsLocalDatabase
        .deletePlanet(PlanetModel.fromEntity(planetEntity));
  }

  @override
  Future<List<PlanetEntity>> getPlanetsLocal() async {
    return _planetsLocalDatabase.getPlanetsLocal();
  }

  @override
  Future<void> savePlanet(PlanetEntity planetEntity) async {
    return _planetsLocalDatabase
        .addPlanet(PlanetModel.fromEntity(planetEntity));
  }
}
