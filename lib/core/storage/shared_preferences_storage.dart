import 'package:injectable/injectable.dart';
import 'package:plant_app/core/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LocalStorage)
class SharedPreferencesStorage implements LocalStorage {
  SharedPreferencesStorage(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<bool?> getBool(String key) async => _preferences.getBool(key);

  @override
  Future<bool> setBool(String key, {required bool value}) =>
      _preferences.setBool(key, value);

  @override
  Future<String?> getString(String key) async => _preferences.getString(key);

  @override
  Future<bool> setString(String key, String value) =>
      _preferences.setString(key, value);

  @override
  Future<bool> remove(String key) => _preferences.remove(key);

  @override
  Future<bool> clear() => _preferences.clear();
}
