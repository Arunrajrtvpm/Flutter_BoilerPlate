import '../../../utils/helper_class/shared_preferences.dart';

class UserRepository {
  clearStorage() async {
    await SharedPreferencesHelper.clearStorage();
  }

  deleteToken() async {
    await SharedPreferencesHelper.remove(tokenKey);
  }

  Future<String> getToken() async {
    String? token = await SharedPreferencesHelper.getString(tokenKey);
    return token ?? "";
  }

  Future<bool> hasToken() async {
    String? token = await SharedPreferencesHelper.getString(tokenKey);
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  saveToken(String email, String token) async {
    await SharedPreferencesHelper.saveString(tokenKey, token);
    await SharedPreferencesHelper.saveString(emailKey, email);
  }

  isRememberMeEnabled() async {
    await SharedPreferencesHelper.getBoolean(rememberMeEnabledKey);
  }

  saveRememberMeValue(bool value) async {
    await SharedPreferencesHelper.saveBoolean(rememberMeEnabledKey, value);
  }
}
