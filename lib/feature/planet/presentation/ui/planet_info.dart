import 'package:books_api/di/service.dart';
import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:books_api/feature/planet/presentation/bloc/local/local_planet_bloc.dart';
import 'package:books_api/feature/planet/presentation/bloc/local/local_planet_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetInfo extends StatefulWidget {
  final PlanetEntity? planetEntity;
  const PlanetInfo({super.key, required this.planetEntity});

  @override
  State<PlanetInfo> createState() => _PlanetInfoState();
}

class _PlanetInfoState extends State<PlanetInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => service<LocalPlanetBloc>(),
        child: PlanetInfoWidget(planet: widget.planetEntity));
  }
}

class PlanetInfoWidget extends StatefulWidget {
  final PlanetEntity? planet;
  const PlanetInfoWidget({super.key, this.planet});

  @override
  State<PlanetInfoWidget> createState() => _PlanetInfoWidgetState();
}

class _PlanetInfoWidgetState extends State<PlanetInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  widget.planet!.name!,
                  style: TextStyle(color: Colors.black),
                ),
                background: const Icon(Icons.public)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(children: [
                Text(widget.planet!.mass! != -1.0
                    ? "Mass: ${widget.planet!.mass!}"
                    : "Mass: no data"),
                Text(widget.planet!.radius! != -1.0
                    ? "Radius: ${widget.planet!.radius!}"
                    : "Radius: no data"),
                Text(widget.planet!.period! != -1.0
                    ? "Period: ${widget.planet!.period!}"
                    : "Period: no data"),
                Text(widget.planet!.semiMajorAxis! != -1.0
                    ? "Semi major axis: ${widget.planet!.semiMajorAxis!}"
                    : "Semi major axis: no data"),
                Text(widget.planet!.temperature! != -1.0
                    ? "Temperature: ${widget.planet!.temperature!}"
                    : "Temperature: no data"),
                Text(widget.planet!.distanceLightYear! != -1.0
                    ? "Distance light year: ${widget.planet!.distanceLightYear!}"
                    : "Distance light year: no data"),
                Text(widget.planet!.hostStarMass! != -1.0
                    ? "Host star mass: ${widget.planet!.hostStarMass!}"
                    : "Host star mass: no data"),
                Text(widget.planet!.hostStarTemperature! != -1.0
                    ? "Host star temperature: ${widget.planet!.hostStarTemperature!}"
                    : "Host star temperature: no data"),
              ]),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onAddFavouriteCat(context);
          Navigator.pop(context);
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }

  void _onAddFavouriteCat(BuildContext context) {
    BlocProvider.of<LocalPlanetBloc>(context).add(AddPlanet(widget.planet!));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepPurpleAccent,
        content: Text(
          'Planet named ${widget.planet!.name} added to your favourites',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
