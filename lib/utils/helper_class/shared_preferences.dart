import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> saveString(String key, String value) async {
    final prefs = await getInstance();
    return await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await getInstance();
    return prefs.getString(key);
  }

  static Future<String?> getToken() async {
    final prefs = await getInstance();
    return prefs.getString(tokenKey);
  }

  static Future<bool> saveBoolean(String key, bool value) async {
    final prefs = await getInstance();
    return await prefs.setBool(key, value);
  }

  static Future<bool> getBoolean(String key) async {
    final prefs = await getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<bool> remove(String key) async {
    final prefs = await getInstance();
    return await prefs.remove(key);
  }

  static Future<bool> clearStorage() async {
    final prefs = await getInstance();
    return await prefs.clear();
  }
}

const String tokenKey = "tokenKey";
const String emailKey = "emailKey";
const String rememberMeEnabledKey = "rememberMeEnabled";
const String loginResponseKey = "loginResponseKey";
