import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  static final _supabase = Supabase.instance.client;

  static Future<bool> signUp({required String email, required String password, required String username}) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'first_name': username}
      );

      if (response.user != null) {
        return true; 
      } else {
        
        return false;
      }
    } on AuthException {
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> signIn({required String email, required String password}) async {
    try {
      final response = await _supabase.auth.signInWithPassword(email: email, password: password);

      if (response.user != null) {
        return true; 
      } else {
        return false;
      }
    } on AuthException catch (e) {
      print(e.message);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
