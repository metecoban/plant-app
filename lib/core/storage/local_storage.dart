abstract interface class LocalStorage {
  Future<bool?> getBool(String key);

  Future<bool> setBool(String key, {required bool value});

  Future<String?> getString(String key);

  Future<bool> setString(String key, String value);

  Future<bool> remove(String key);

  Future<bool> clear();
}
