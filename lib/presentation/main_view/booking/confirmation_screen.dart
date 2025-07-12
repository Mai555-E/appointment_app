import 'dart:async';

import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/routes.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  late Timer _timer;

  @override
  void dispose() => {_timer.cancel(), super.dispose()};

  void navigateTo() => Navigator.pushReplacementNamed(context, NamedRoutes.mainView);

  void _startTime() => _timer = _timer = Timer(Duration(seconds: 1),()=> navigateTo());
  @override
  void initState() => {_startTime(), super.initState()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: AppColors.primary, size: 160),
            Text("Confirmation success", style: TextStyle(fontSize: 35))
            
          ],
        ),
      ),
    );
  }
}
