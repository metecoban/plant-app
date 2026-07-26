import 'package:flutter/material.dart';
import 'package:plant_app/app/app.dart';
import 'package:plant_app/app/di/injection.dart';
import 'package:plant_app/core/i18n/strings.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(child: const App()));
}
