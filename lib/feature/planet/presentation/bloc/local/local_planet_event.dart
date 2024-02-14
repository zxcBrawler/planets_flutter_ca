import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';

abstract class LocalPlanetEvent {
  final PlanetEntity? planetEntity;

  const LocalPlanetEvent({this.planetEntity});

  List<Object> get props => [planetEntity!];
}

class GetPlanetsLocal extends LocalPlanetEvent {
  const GetPlanetsLocal();
}

class DeletePlanet extends LocalPlanetEvent {
  const DeletePlanet(PlanetEntity planetEntity)
      : super(planetEntity: planetEntity);
}

class AddPlanet extends LocalPlanetEvent {
  const AddPlanet(PlanetEntity planetEntity)
      : super(planetEntity: planetEntity);
}
