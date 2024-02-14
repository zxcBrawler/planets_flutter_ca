import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';

abstract class LocalPlanetState {
  final List<PlanetEntity>? planets;

  const LocalPlanetState({this.planets});

  List<Object> get props => [planets!];
}

class LocalPlanetsLoading extends LocalPlanetState {
  const LocalPlanetsLoading();
}

class LocalPlanetsDone extends LocalPlanetState {
  const LocalPlanetsDone(List<PlanetEntity> planets) : super(planets: planets);
}
