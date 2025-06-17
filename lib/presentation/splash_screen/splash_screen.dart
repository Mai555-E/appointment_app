import 'dart:async';

import 'package:flutter/material.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  @override
  void dispose() => {_timer.cancel(), super.dispose()};
  void navigateTo() => Navigator.pushReplacementNamed(context, NamedRoutes.signInScreen);
  void startTime() => _timer = Timer(Duration(milliseconds: 1500), () => navigateTo());
  @override
  void initState() => {startTime(), super.initState()};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(AppAssets.healthyCareImage),
      ),
    );
  }
}
