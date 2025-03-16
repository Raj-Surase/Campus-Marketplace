import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Constants for Secure Storage Keys
class StorageKeys {
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  static const String userPhoto = 'user_photo';
  static const String accessToken = 'access_token';
}

/// Local Storage Helper Class
class LocalStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Save data to storage
  static Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read data from storage
  static Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete a specific key from storage
  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Delete all stored data
  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
