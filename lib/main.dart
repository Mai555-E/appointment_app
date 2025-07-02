import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot;
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/initializer_services.dart';
import 'domain/provider/my_provider.dart';
import 'domain/shared_preferences/shared_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initialization.initializerServices();
  SharedAuth.initShared();
  await SharedAuth.currentStatus();
  await dot.dotenv.load(fileName: '.env');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MyProvider()),
  ], child: ECommerceApp()));
}
