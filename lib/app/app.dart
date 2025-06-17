import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/resources/app_theme.dart';
import '../presentation/resources/routes.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //
      
      onGenerateRoute: RouteGenerator.getRoute,
     initialRoute: NamedRoutes.splash,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.currentMode,
    );
  }
}
