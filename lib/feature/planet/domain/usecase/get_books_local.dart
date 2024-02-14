import 'package:books_api/core/usecase/usecase.dart';
import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:books_api/feature/planet/domain/repository/planet_repository.dart';

class GetPlanetsLocalUseCase implements UseCase<List<PlanetEntity>, void> {
  final PlanetRepository _planetRepository;

  GetPlanetsLocalUseCase(this._planetRepository);

  @override
  Future<List<PlanetEntity>> call({void params}) {
    return _planetRepository.getPlanetsLocal();
  }
}
