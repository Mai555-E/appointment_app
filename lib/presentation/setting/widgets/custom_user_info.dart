import '../../../domain/shared_preferences/my_shared_preferences.dart';

import '../../resources/routes.dart';
import 'package:flutter/material.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_colors.dart';

class CustomUserInfoSetting extends StatelessWidget {
  const CustomUserInfoSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, NamedRoutes.profilePage),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: AppColors.lightGrey, thickness: 3),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.asset(AppAssets.doctor1, height: 120),
              Column(
                children: [
                  Text(MySharedPreferences.getUserName, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                  Text("Patient", style: TextStyle(fontSize: 15, color: AppColors.grey))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
