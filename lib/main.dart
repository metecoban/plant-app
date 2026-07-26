import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:plant_app/app/app.dart';
import 'package:plant_app/app/di/injection.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/core/logger/app_bloc_observer.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureDependencies();
  Bloc.observer = getIt<AppBlocObserver>();
  await LocaleSettings.useDeviceLocale();

  runApp(TranslationProvider(child: const App()));
  FlutterNativeSplash.remove();
}
