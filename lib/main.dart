import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'domain/model/my_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EasyLocalization.logger.enableLevels = []; // to remove logger
  await EasyLocalization.ensureInitialized();

  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission();
  await Supabase.initialize(
    url: "https://vjbwoxatckptsxfshjzc.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZqYndveGF0Y2twdHN4ZnNoanpjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY1ODA4MzcsImV4cCI6MjA2MjE1NjgzN30.2eFaG2iL8ZenRcnenMBXekB5Y_6dqak_WrKpd0TChbs",
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MyProvider()),
  ], child: const ECommerceApp()));
}
