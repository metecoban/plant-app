import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/core/storage/local_storage.dart';
import 'package:plant_app/core/storage/storage_keys.dart';

abstract interface class AppSettingsRepository {
  Future<ThemeMode?> getThemeMode();

  Future<void> saveThemeMode(ThemeMode mode);

  Future<AppLocale?> getLocale();

  Future<void> saveLocale(AppLocale locale);
}

@LazySingleton(as: AppSettingsRepository)
class AppSettingsRepositoryImpl implements AppSettingsRepository {
  const AppSettingsRepositoryImpl(this._localStorage);

  final LocalStorage _localStorage;

  @override
  Future<ThemeMode?> getThemeMode() async {
    final value = await _localStorage.getString(StorageKeys.themeMode);
    return switch (value) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => null,
    };
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) {
    final value = mode == ThemeMode.dark ? 'dark' : 'light';
    return _localStorage.setString(StorageKeys.themeMode, value);
  }

  @override
  Future<AppLocale?> getLocale() async {
    final value = await _localStorage.getString(StorageKeys.locale);
    return switch (value) {
      'en' => AppLocale.en,
      'tr' => AppLocale.tr,
      _ => null,
    };
  }

  @override
  Future<void> saveLocale(AppLocale locale) {
    return _localStorage.setString(StorageKeys.locale, locale.languageCode);
  }
}
