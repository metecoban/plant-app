import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/app/settings/app_settings_repository.dart';

@injectable
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._repository) : super(ThemeMode.light);

  final AppSettingsRepository _repository;

  Future<void> load() async {
    final savedTheme = await _repository.getThemeMode();
    if (savedTheme != null) {
      emit(savedTheme);
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    emit(mode);
    await _repository.saveThemeMode(mode);
  }
}
