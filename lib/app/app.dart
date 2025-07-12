import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/provider/my_provider.dart';
import '../presentation/resources/app_theme.dart';
import '../presentation/resources/routes.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: NamedRoutes.splash,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: AppTheme.currentMode),
    );
  }
}
