import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:dio/dio.dart';

abstract class RemotePlanetState {
  final List<PlanetEntity>? planets;
  final DioException? error;

  const RemotePlanetState({this.planets, this.error});

  List<Object> get props => [planets!, error!];
}

class RemotePlanetsLoading extends RemotePlanetState {
  const RemotePlanetsLoading();
}

class RemotePlanetsDone extends RemotePlanetState {
  const RemotePlanetsDone(List<PlanetEntity> planets) : super(planets: planets);
}

class RemotePlanetsError extends RemotePlanetState {
  const RemotePlanetsError(DioException error) : super(error: error);
}
