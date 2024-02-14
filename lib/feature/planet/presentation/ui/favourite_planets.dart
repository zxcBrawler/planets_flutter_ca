import 'package:books_api/di/service.dart';
import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:books_api/feature/planet/presentation/bloc/local/local_book_state.dart';
import 'package:books_api/feature/planet/presentation/bloc/local/local_planet_bloc.dart';
import 'package:books_api/feature/planet/presentation/bloc/local/local_planet_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePlanets extends StatefulWidget {
  const FavouritePlanets({super.key});

  @override
  State<FavouritePlanets> createState() => _FavouritePlanetsState();
}

class _FavouritePlanetsState extends State<FavouritePlanets> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => service<LocalPlanetBloc>()..add(const GetPlanetsLocal()),
      child: Scaffold(
        body: BlocBuilder<LocalPlanetBloc, LocalPlanetState>(
          builder: (context, state) {
            if (state is LocalPlanetsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LocalPlanetsDone) {
              if (state.planets!.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sentiment_dissatisfied,
                        size: 40,
                      ),
                      Text(
                        "no favourite planets",
                        style: TextStyle(fontSize: 30),
                      ),
                      // Add more widgets as needed
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: state.planets!.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          _onRemovePlanet(context, state.planets![index]);
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Center(
                                    child: Text(
                                      state.planets![index].name ?? "-",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _onRemovePlanet(BuildContext context, PlanetEntity planetEntity) {
    BlocProvider.of<LocalPlanetBloc>(context).add(DeletePlanet(planetEntity));
  }
}
