import 'package:bloc/bloc.dart';
import 'package:books_api/feature/planet/domain/usecase/add_book_local.dart';
import 'package:books_api/feature/planet/domain/usecase/delete_book_local.dart';
import 'package:books_api/feature/planet/domain/usecase/get_books_local.dart';
import 'package:books_api/feature/planet/presentation/bloc/local/local_book_state.dart';
import 'package:books_api/feature/planet/presentation/bloc/local/local_planet_event.dart';

class LocalPlanetBloc extends Bloc<LocalPlanetEvent, LocalPlanetState> {
  final GetPlanetsLocalUseCase _getPlanetsLocalUseCase;
  final AddPlanetsLocalUseCase _addPlanetsLocalUseCase;
  final DeletePlanetsLocalUseCase _deletePlanetsLocalUseCase;
  LocalPlanetBloc(this._getPlanetsLocalUseCase, this._addPlanetsLocalUseCase,
      this._deletePlanetsLocalUseCase)
      : super(const LocalPlanetsLoading()) {
    on<GetPlanetsLocal>(onGetPlanets);
    on<DeletePlanet>(onDeletePlanet);
    on<AddPlanet>(onAddPlanet);
  }

  void onGetPlanets(
      GetPlanetsLocal event, Emitter<LocalPlanetState> emitter) async {
    final planet = await _getPlanetsLocalUseCase();
    emitter(LocalPlanetsDone(planet));
  }

  void onDeletePlanet(
      DeletePlanet event, Emitter<LocalPlanetState> emitter) async {
    await _deletePlanetsLocalUseCase(params: event.planetEntity);
    final planet = await _getPlanetsLocalUseCase();
    emitter(LocalPlanetsDone(planet));
  }

  void onAddPlanet(AddPlanet event, Emitter<LocalPlanetState> emitter) async {
    await _addPlanetsLocalUseCase(params: event.planetEntity);
    final planet = await _getPlanetsLocalUseCase();
    emitter(LocalPlanetsDone(planet));
  }
}
