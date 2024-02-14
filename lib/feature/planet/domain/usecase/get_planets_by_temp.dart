import 'package:books_api/core/resources/data_state.dart';
import 'package:books_api/core/usecase/usecase.dart';
import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:books_api/feature/planet/domain/repository/planet_repository.dart';

class GetPlanetsByTempUsecase
    implements UseCase<DataState<List<PlanetEntity>>, void> {
  final PlanetRepository _planetRepository;

  GetPlanetsByTempUsecase(this._planetRepository);

  @override
  Future<DataState<List<PlanetEntity>>> call({void params}) async {
    return await _planetRepository.getPlanetsByMinTemp();
  }
}
