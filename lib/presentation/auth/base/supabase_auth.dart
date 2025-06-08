import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../resources/app_colors.dart';
import '../../resources/routes.dart';

class SupabaseAuth {
  static final _supabase = Supabase.instance.client;

  static Future<void> signUp(
      {required String email, required String password, required String username, required BuildContext context}) async {
    try {
      final response = await _supabase.auth.signUp(email: email, password: password, data: {'first_name': username});

      if (response.user != null) {
        Get.toNamed(NamedRoutes.signInScreen);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign up success"), backgroundColor: AppColors.thirdColor,));
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
        Get.offNamed(NamedRoutes.mainView);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("login success") , backgroundColor: AppColors.thirdColor));
      }
    } on AuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("login Failed , check your password or email")));

     
    } catch (e) {
      print(e);
    }
  }
}


