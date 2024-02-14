class PlanetEntity {
  final String? name;
  final double? mass;
  final double? radius;
  final double? period;
  final double? semiMajorAxis;
  final double? temperature;
  final double? distanceLightYear;
  final double? hostStarMass;
  final double? hostStarTemperature;

  PlanetEntity(
      {this.name,
      this.mass,
      this.radius,
      this.period,
      this.semiMajorAxis,
      this.temperature,
      this.distanceLightYear,
      this.hostStarMass,
      this.hostStarTemperature});

  List<Object?> get props {
    return [
      name,
      mass,
      radius,
      period,
      semiMajorAxis,
      temperature,
      distanceLightYear,
      hostStarMass,
      hostStarTemperature
    ];
  }
}
