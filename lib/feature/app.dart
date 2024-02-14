import 'package:books_api/core/route/router.dart';
import 'package:books_api/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
