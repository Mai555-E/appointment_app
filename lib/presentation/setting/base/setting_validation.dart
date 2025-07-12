import 'package:flutter/material.dart';

import '../../auth/base/supabase_auth.dart';

class SettingValidation {
  static Future<void> validation(String title, BuildContext context) async {
    switch (title.toLowerCase()) {
      case "logout":
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: Column(
                      spacing: 10,
                      children: [
                        Text('LOG OUT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        Text(" Are you sure want to log out?", style: TextStyle(fontSize: 13)),
                      
                      ],
                    ),
                    
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel", style: TextStyle(decoration: TextDecoration.none))),
                      TextButton(
                          onPressed: () async {
                            await SupabaseAuth.logOut(context);
                          },
                          child: Text("ok", style: TextStyle(decoration: TextDecoration.none))),
                          
                    ]));
        break;
      default:
    }
  }
}
