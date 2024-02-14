import 'package:bloc/bloc.dart';
import 'package:books_api/core/resources/data_state.dart';
import 'package:books_api/feature/planet/domain/usecase/get_planets_by_radius.dart';
import 'package:books_api/feature/planet/domain/usecase/get_planets_by_temp.dart';
import 'package:books_api/feature/planet/domain/usecase/get_planets_usecase.dart';
import 'package:books_api/feature/planet/presentation/bloc/remote/planet_event.dart';
import 'package:books_api/feature/planet/presentation/bloc/remote/planet_state.dart';

class PlanetsBloc extends Bloc<PlanetsEvent, RemotePlanetState> {
  final GetPlanetsUsecase _getPlanetsUsecase;
  final GetPlanetsByRadiusUsecase _getPlanetsByRadiusUsecase;
  final GetPlanetsByTempUsecase _getPlanetsByTempUsecase;

  PlanetsBloc(this._getPlanetsUsecase, this._getPlanetsByRadiusUsecase,
      this._getPlanetsByTempUsecase)
      : super(const RemotePlanetsLoading()) {
    on<GetPlanets>(onGetPlanets);
    on<GetPlanetsByRadius>(onGetPlanetsByRadius);
    on<GetPlanetsByTemp>(onGetPlanetsByTemp);
  }

  void onGetPlanets(
      GetPlanets getPlanets, Emitter<RemotePlanetState> emitter) async {
    final dataState = await _getPlanetsUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemotePlanetsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error);

      emitter(RemotePlanetsError(dataState.error!));
    }
  }

  void onGetPlanetsByTemp(
      GetPlanetsByTemp getPlanets, Emitter<RemotePlanetState> emitter) async {
    final dataState = await _getPlanetsByTempUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemotePlanetsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error);

      emitter(RemotePlanetsError(dataState.error!));
    }
  }

  void onGetPlanetsByRadius(
      GetPlanetsByRadius getPlanets, Emitter<RemotePlanetState> emitter) async {
    final dataState = await _getPlanetsByRadiusUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemotePlanetsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error);

      emitter(RemotePlanetsError(dataState.error!));
    }
  }
}
