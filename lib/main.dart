import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot;
import 'app/app.dart';
import 'app/initializer_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initialization.initializerServices();
  await Initialization.sharedAuthData();

  await dot.dotenv.load(fileName: '.env');
  runApp(ECommerceApp());
}
