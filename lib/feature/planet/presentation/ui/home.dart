import 'package:books_api/core/route/router.dart';
import 'package:books_api/core/route/router_utils.dart';
import 'package:books_api/di/service.dart';
import 'package:books_api/feature/planet/presentation/bloc/remote/planet_bloc.dart';
import 'package:books_api/feature/planet/presentation/bloc/remote/planet_event.dart';
import 'package:books_api/feature/planet/presentation/bloc/remote/planet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanetsBloc>(
      create: (context) => service()..add(const GetPlanets()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            BlocBuilder<PlanetsBloc, RemotePlanetState>(builder: (_, state) {
              if (state is RemotePlanetsLoading) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is RemotePlanetsError) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Icon(Icons.refresh),
                  ),
                );
              }
              if (state is RemotePlanetsDone) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            router.push(Pages.bookDetails.screenPath,
                                extra: {state.planets![index]});
                          },
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
                                        state.planets![index].name!,
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
                    childCount: state.planets!.length,
                  ),
                );
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
