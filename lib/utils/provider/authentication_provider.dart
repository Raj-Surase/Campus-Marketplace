// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthenticationProvider {
//   final SupabaseClient _supabase = Supabase.instance.client;

//   /// Fetch user from Supabase by Firebase UID
//   Future<Map<String, dynamic>?> fetchUserByFirebaseUid(
//       String firebaseUid) async {
//     final response = await _supabase
//         .from('users')
//         .select()
//         .eq('firebase_uid', firebaseUid)
//         .maybeSingle();

//     return response;
//   }

//   /// Fetch user from Supabase by UUID
//   Future<Map<String, dynamic>?> fetchUserById(String userId) async {
//     final response =
//         await _supabase.from('users').select().eq('id', userId).maybeSingle();

//     return response;
//   }

//   /// Insert new user into Supabase
//   Future<void> insertUser(Map<String, dynamic> userData) async {
//     await _supabase.from('users').insert(userData);
//   }
// }
