import 'package:campus_marketplace/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:campus_marketplace/utils/model/user.dart';

class UserProvider extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  /// Fetch user by Firebase UID and update state
  Future<void> fetchUserByFirebaseUid(String firebaseUid) async {
    _isLoading = true;
    notifyListeners();

    final response =
        await _supabase
            .from('users')
            .select()
            .eq('firebase_uid', firebaseUid)
            .maybeSingle();

    _isLoading = false;

    if (response == null) {
      debugPrint("Error fetching user: No data found.");
      return;
    }

    _user = UserModel.fromJson(response);
    notifyListeners();

    /// ✅ Load favorite IDs from local storage
    await _loadFavoriteIdsFromStorage();
  }

  /// Insert a new user
  Future<void> insertUser(Map<String, dynamic> userData) async {
    await _supabase.from('users').insert(userData);
  }

  /// ✅ Load favorite IDs from local storage
  Future<void> _loadFavoriteIdsFromStorage() async {
    List<String> favoriteIds = await LocalStorageMethods.getFavoriteIds();
    if (_user != null) {
      _user = _user!.copyWith(favoriteIds: favoriteIds);
      notifyListeners();
    }
  }

  /// ✅ Add a product to favorites (Local Storage)
  Future<void> addFavorite(String productId) async {
    List<String> favoriteIds = await LocalStorageMethods.getFavoriteIds();
    if (!favoriteIds.contains(productId)) {
      favoriteIds.add(productId);
      await updateFavoriteIds(favoriteIds);
    }
  }

  /// ✅ Remove a product from favorites (Local Storage)
  Future<void> removeFavorite(String productId) async {
    List<String> favoriteIds = await LocalStorageMethods.getFavoriteIds();
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
      await updateFavoriteIds(favoriteIds);
    }
  }

  /// ✅ Update the entire list of favorite IDs in local storage
  Future<void> updateFavoriteIds(List<String> newFavoriteIds) async {
    await LocalStorageMethods.saveFavoriteIds(newFavoriteIds);
    if (_user != null) {
      _user = _user!.copyWith(favoriteIds: newFavoriteIds);
      notifyListeners();
    }
  }
}
