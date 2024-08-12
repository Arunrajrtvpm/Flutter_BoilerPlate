import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage? _instance;

  factory SecureStorage() {
    _instance ??= SecureStorage._(const FlutterSecureStorage());
    return _instance!;
  }

  SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;
  static const _passwordKey = 'GM_PASSWORD';
  static const _emailKey = 'GM_EMAIL';
  static const _rememberMeKey = 'REMEMBER_ME';

  Future<void> persistEmailAndToken(String email, String password) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _passwordKey, value: password);
    await _storage.write(key: _rememberMeKey, value: "true");
  }

  Future<bool> hasPassword() async {
    var value = await _storage.read(key: _passwordKey);
    return value != null;
  }

  Future<bool> isRememberMeEnabled() async {
    var value = await _storage.read(key: _rememberMeKey);
    return value != null && value == "true";
  }

  Future<bool> hasEmail() async {
    var value = await _storage.read(key: _emailKey);
    return value != null;
  }

  Future<void> deletePassword() async {
    return await _storage.delete(key: _passwordKey);
  }

  Future<void> deleteEmail() async {
    return await _storage.delete(key: _emailKey);
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: _emailKey);
  }

  Future<String?> getPassword() async {
    return await _storage.read(key: _passwordKey);
  }

  Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }
}
