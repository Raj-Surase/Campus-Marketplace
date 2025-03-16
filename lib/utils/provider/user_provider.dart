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

    final response = await _supabase
        .from('users')
        .select()
        .eq('firebase_uid', firebaseUid)
        .maybeSingle();

    _isLoading = false;

    if (response == null) {
      debugPrint("Error fetching user: No data found.");
      return;
    }

    _user = UserModel.fromJson(response); // ✅ Store user in state
    notifyListeners();
  }

  /// Insert a new user
  Future<void> insertUser(Map<String, dynamic> userData) async {
    await _supabase.from('users').insert(userData);
  }

  // /// Update user details
  // Future<bool> updateUser(UserModel user) async {
  //   try {
  //     await _supabase.from('users').update(user.toJson()).eq('id', user.id);
  //     _user = user;
  //     notifyListeners();
  //     return true;
  //   } catch (e) {
  //     debugPrint("Error updating user: $e");
  //     return false;
  //   }
  // }


}
