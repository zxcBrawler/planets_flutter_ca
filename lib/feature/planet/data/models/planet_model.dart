import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:hive/hive.dart';

part 'planet_model.g.dart';

@HiveType(typeId: 0)
class PlanetModel extends PlanetEntity {
  PlanetModel(
      {@HiveField(0) String? name,
      @HiveField(1) double? mass,
      @HiveField(2) double? radius,
      @HiveField(3) double? period,
      @HiveField(4) double? semiMajorAxis,
      @HiveField(5) double? temperature,
      @HiveField(6) double? distanceLightYear,
      @HiveField(7) double? hostStarMass,
      @HiveField(8) double? hostStarTemperature})
      : super(
            name: name,
            mass: mass,
            radius: radius,
            period: period,
            semiMajorAxis: semiMajorAxis,
            temperature: temperature,
            distanceLightYear: distanceLightYear,
            hostStarMass: hostStarMass,
            hostStarTemperature: hostStarTemperature);

  factory PlanetModel.fromJson(Map<String, dynamic> map) {
    return PlanetModel(
      name: map["name"] ?? "",
      mass: map["mass"] ?? -1.0,
      radius: map["radius"] ?? -1.0,
      period: map["period"] ?? -1.0,
      semiMajorAxis: map["semi_major_axis"] ?? -1.0,
      temperature: map["temperature"] ?? -1.0,
      distanceLightYear: map["distance_light_year"] ?? -1.0,
      hostStarMass: map["host_star_mass"] ?? -1.0,
      hostStarTemperature: map["host_star_temperature"] ?? -1.0,
    );
  }

  factory PlanetModel.fromEntity(PlanetEntity planetEntity) {
    return PlanetModel(
        name: planetEntity.name,
        mass: planetEntity.mass,
        radius: planetEntity.radius,
        period: planetEntity.period,
        semiMajorAxis: planetEntity.semiMajorAxis,
        temperature: planetEntity.temperature,
        distanceLightYear: planetEntity.distanceLightYear,
        hostStarMass: planetEntity.hostStarMass,
        hostStarTemperature: planetEntity.hostStarTemperature);
  }
}
