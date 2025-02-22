import 'package:shared_preferences/shared_preferences.dart';

class LocalDataService {
  final SharedPreferences prefs;

  LocalDataService({required this.prefs});

  Future<bool> setBoolValue(String key) async {
    return await prefs.setBool(key, true);
  }

  bool getBoolValue(String key) {
    return prefs.getBool(key) ?? false;
  }

  Future<void> clearData(String key) async {
    await prefs.remove(key);
  }

  String getString(String key) {
    return prefs.getString(key) ?? "";
  }

  Future<void> setString({required String key, required String value}) async {
    await prefs.setString(key, value);
  }
}
