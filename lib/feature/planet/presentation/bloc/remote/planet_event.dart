abstract class PlanetsEvent {
  final dynamic param;
  const PlanetsEvent({this.param});

  List<Object> get props => [param!];
}

class GetPlanets extends PlanetsEvent {
  const GetPlanets();
}

class GetPlanetsByRadius extends PlanetsEvent {
  const GetPlanetsByRadius();
}

class GetPlanetsByTemp extends PlanetsEvent {
  const GetPlanetsByTemp();
}
