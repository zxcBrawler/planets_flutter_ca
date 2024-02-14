import 'package:books_api/di/service.dart';
import 'package:books_api/feature/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
