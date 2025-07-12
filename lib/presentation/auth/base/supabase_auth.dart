import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/shared_preferences/shared_auth.dart';
import '../../resources/app_colors.dart';
import '../../resources/routes.dart';

class SupabaseAuth {
  static final _supabase = Supabase.instance.client;

  static Future<void> signUp(
      {required String email, required String password, required String username, required BuildContext context}) async {
    try {
      final response = await _supabase.auth.signUp(email: email, password: password, data: {'first_name': username});

      if (response.user != null) {
        Navigator.pushNamed(context, NamedRoutes.signInScreen);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign up success"), backgroundColor: AppColors.thirdColor));
      }
    } on AuthException {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sign up Failed")));
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> signIn({required String email, required String password, required BuildContext context}) async {
    try {
      final response = await _supabase.auth.signInWithPassword(email: email, password: password);

      if (response.user != null) {
        Navigator.pushReplacementNamed(context, NamedRoutes.mainView);
        await SharedAuth.saveLoginStatus();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("login success"), backgroundColor: AppColors.thirdColor));
      }
    } on AuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("login Failed , check your password or email")));
    } catch (e) {
      print(e);
    }
  }

  static Future<void> logOut(BuildContext context) async {
    await _supabase.auth.signOut();
    await SharedAuth.userLogout();
   // await MySharedPreferences.logout();
      Navigator.pushReplacementNamed(context, NamedRoutes.signInScreen);
  }
}
