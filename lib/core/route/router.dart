import 'package:books_api/core/route/router_utils.dart';
import 'package:books_api/feature/planet/domain/entities/planet_entity.dart';
import 'package:books_api/feature/planet/presentation/ui/categories_planets.dart';
import 'package:books_api/feature/planet/presentation/ui/favourite_planets.dart';
import 'package:books_api/feature/planet/presentation/ui/filtered_planets.dart';
import 'package:books_api/feature/planet/presentation/ui/home.dart';
import 'package:books_api/feature/planet/presentation/ui/main_screen.dart';
import 'package:books_api/feature/planet/presentation/ui/planet_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final router =
    GoRouter(initialLocation: '/', navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: Pages.bookDetails.screenPath,
    name: Pages.bookDetails.screenName,
    pageBuilder: (context, state) {
      Set<PlanetEntity> planet = state.extra as Set<PlanetEntity>;
      return CupertinoPage(
          child: PlanetInfo(
        planetEntity: planet.first,
      ));
    },
  ),
  GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: Pages.filteredCategory.screenPath,
    name: Pages.filteredCategory.screenName,
    pageBuilder: (context, state) {
      String category = state.extra as String;
      return CupertinoPage(
          child: FilteredPlanets(
        category: category,
      ));
    },
  ),
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    pageBuilder: (context, state, child) {
      return NoTransitionPage(
          child: MainScreen(
        location: state.matchedLocation,
        child: child,
      ));
    },
    routes: [
      GoRoute(
        path: Pages.home.screenPath,
        name: Pages.home.screenName,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: Home());
        },
      ),
      GoRoute(
        path: Pages.favourite.screenPath,
        name: Pages.favourite.screenName,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: FavouritePlanets());
        },
      ),
      GoRoute(
        path: Pages.categories.screenPath,
        name: Pages.categories.screenName,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: CategoriesPlanets());
        },
      ),
    ],
  ),
]);
