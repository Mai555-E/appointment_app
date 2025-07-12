import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/provider/my_provider.dart';
import '../../domain/shared_preferences/my_shared_preferences.dart';
import '../../domain/shared_preferences/shared_auth.dart';
import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import '../widgets/leading_app_bar.dart';
import 'base/setting_validation.dart';
import 'widgets/custom_user_info.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() => {MySharedPreferences.initializeShared(), SharedAuth.initShared(), super.initState()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingAppBar(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 25,
          children: [
            CustomUserInfoSetting(),
            Column(
                spacing: 15,
                children: List.generate(AppConstants.settingData.length,
                    (i) => _buildListTile(title: AppConstants.settingData[i].title, icon: AppConstants.settingData[i].icon, context))),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchButton(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return SizedBox(
        width: 30,
        child: Switch(
            activeColor: AppColors.primary,
            value: provider.switchValue,
            onChanged: (val) {
              provider.changeSwitchValue(val);
            }));
  }

  Widget _buildListTile(BuildContext context, {required String title, required IconData icon}) {
    return ListTile(
        onTap: () async {
          await SettingValidation.validation(title, context);
        },
        leading: Container(
            width: 50,
            height: 45,
            decoration: BoxDecoration(color: AppColors.lightGrey, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Icon(icon, color: AppColors.primary)),
        title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        trailing: (title.toLowerCase() == "notification")
            ? _buildSwitchButton(context)
            : Icon(Icons.arrow_circle_right_rounded, size: 30, color: AppColors.primary));
  }
}
