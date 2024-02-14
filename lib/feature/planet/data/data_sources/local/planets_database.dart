import 'package:books_api/feature/planet/data/models/planet_model.dart';
import 'package:hive/hive.dart';

class PlanetsLocalDatabase {
  final Box<PlanetModel> planetBox;

  PlanetsLocalDatabase(this.planetBox);

  void addPlanet(PlanetModel planetModel) {
    planetBox.put(planetModel.name, planetModel);
  }

  void deletePlanet(PlanetModel planetModel) {
    planetBox.delete(planetModel.name);
  }

  List<PlanetModel> getPlanetsLocal() {
    return planetBox.values.whereType<PlanetModel>().toList();
  }
}
