import 'package:books_api/core/resources/data_state.dart';
import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';

abstract class PlanetRepository {
  Future<DataState<List<PlanetEntity>>> getPlanets();
  Future<DataState<List<PlanetEntity>>> getPlanetsByMinRadius();
  Future<DataState<List<PlanetEntity>>> getPlanetsByMinTemp();

  Future<List<PlanetEntity>> getPlanetsLocal();
  Future<void> savePlanet(PlanetEntity planetEntity);
  Future<void> deletePlanet(PlanetEntity planetEntity);
}
