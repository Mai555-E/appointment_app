import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot;
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/initializer_services.dart';
import 'domain/provider/my_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializerServices();

  await dot.dotenv.load(fileName: '.env');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MyProvider()),
  ], child: const ECommerceApp()));
}
