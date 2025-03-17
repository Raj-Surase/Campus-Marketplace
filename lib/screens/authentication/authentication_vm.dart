import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:campus_marketplace/utils/model/user.dart';
import 'package:campus_marketplace/utils/provider/user_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationViewModel extends ChangeNotifier {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final UserProvider _userProvider = UserProvider(); // Use the new class

  firebase.User? _firebaseUser;
  bool _isCheckingAuth = true;
  Map<String, dynamic>? _userData; // Store user details from Supabase

  AuthenticationViewModel() {
    _initializeAuthState();
  }

  firebase.User? get firebaseUser => _firebaseUser;
  Map<String, dynamic>? get userData => _userData;
  bool get isCheckingAuth => _isCheckingAuth;

  /// Initialize authentication state
  Future<void> _initializeAuthState() async {
    _firebaseUser = _auth.currentUser;
    if (_firebaseUser != null) {
      await _fetchUserFromSupabase(_firebaseUser!.uid);
    }
    _isCheckingAuth = false;
    notifyListeners();
  }

  /// Google Sign-In with Supabase Database Integration
  Future<firebase.UserCredential?> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        debugPrint("Google Sign-In cancelled.");
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken == null) {
        debugPrint("Google Sign-In failed: No ID Token.");
        return null;
      }

      final firebase.OAuthCredential credential = firebase.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      firebase.UserCredential userCredential = await _auth.signInWithCredential(credential);

      _firebaseUser = userCredential.user;
      if (_firebaseUser != null) {
        await _handleUserInSupabase(_firebaseUser!);
      }

      notifyListeners();
      return userCredential;
    } catch (e) {
      debugPrint("Google Sign-In Error: $e");
      return null;
    }
  }

  /// Handle user in Supabase: Insert if new, fetch if existing
  Future<void> _handleUserInSupabase(firebase.User firebaseUser) async {
    // Fetch user from Supabase and update UserProvider
    await _userProvider.fetchUserByFirebaseUid(firebaseUser.uid);

    // Check if the user exists in UserProvider
    if (_userProvider.user == null) {
      // ✅ New user: Set favorite IDs as empty list
      final newUser = UserModel(
        firebaseUid: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? '',
        profileUrl: firebaseUser.photoURL,
        createdAt: DateTime.now(),
        favoriteIds: [], // New users have empty favorites
      ).toJson(); // Convert to JSON for insertion

      await _userProvider.insertUser(newUser);
      await _userProvider.fetchUserByFirebaseUid(firebaseUser.uid); // Fetch new user
    }

    notifyListeners();
  }

  /// Fetch user details from Supabase and update UserProvider
  Future<void> _fetchUserFromSupabase(String userId) async {
    await _userProvider.fetchUserByFirebaseUid(userId);
    notifyListeners(); // ✅ Ensure UI updates
  }

  /// Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    _firebaseUser = null;
    _userData = null;
    notifyListeners();
  }
}
