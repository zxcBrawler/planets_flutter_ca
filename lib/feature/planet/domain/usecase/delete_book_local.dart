import 'package:books_api/core/usecase/usecase.dart';
import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:books_api/feature/planet/domain/repository/planet_repository.dart';

class DeletePlanetsLocalUseCase implements UseCase<void, PlanetEntity> {
  final PlanetRepository _planetRepository;

  DeletePlanetsLocalUseCase(this._planetRepository);

  @override
  Future<void> call({PlanetEntity? params}) {
    return _planetRepository.deletePlanet(params!);
  }
}
