import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Constants for Secure Storage Keys
class StorageKeys {
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  static const String userPhoto = 'user_photo';
  static const String accessToken = 'access_token';
  static const String favoriteIds = 'favorite_ids'; // New key for storing favorite product IDs
}

/// Local Storage Helper Class
class LocalStorageMethods {
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

  /// Save favorite product IDs list
  static Future<void> saveFavoriteIds(List<String> favoriteIds) async {
    await _storage.write(
      key: StorageKeys.favoriteIds,
      value: jsonEncode(favoriteIds),
    );
  }

  /// Get favorite product IDs list
  static Future<List<String>> getFavoriteIds() async {
    String? data = await _storage.read(key: StorageKeys.favoriteIds);
    if (data != null) {
      return List<String>.from(jsonDecode(data));
    }
    return [];
  }

  /// Add a product to favorites
  static Future<void> addFavorite(String productId) async {
    List<String> favoriteIds = await getFavoriteIds();
    if (!favoriteIds.contains(productId)) {
      favoriteIds.add(productId);
      await saveFavoriteIds(favoriteIds);
    }
  }

  /// Remove a product from favorites
  static Future<void> removeFavorite(String productId) async {
    List<String> favoriteIds = await getFavoriteIds();
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
      await saveFavoriteIds(favoriteIds);
    }
  }
}
