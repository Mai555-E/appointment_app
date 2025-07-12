import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/notification/local_notification_service.dart';
import '../domain/shared_preferences/my_shared_preferences.dart';
import '../domain/shared_preferences/shared_auth.dart';
import '../domain/strip_payment/payment_keys.dart';

class Initialization {
  static Future<void> initializerServices() async {
    MySharedPreferences.initializeShared();
    await Firebase.initializeApp();
    await LocalNotificationService.init();
    Stripe.publishableKey = PaymentKeys.publishedKey;
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission();
    await Supabase.initialize(
      url: "https://vjbwoxatckptsxfshjzc.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZqYndveGF0Y2twdHN4ZnNoanpjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY1ODA4MzcsImV4cCI6MjA2MjE1NjgzN30.2eFaG2iL8ZenRcnenMBXekB5Y_6dqak_WrKpd0TChbs",
    );
  }


  static Future<void>sharedAuthData()async{
      SharedAuth.initShared();
  await SharedAuth.currentStatus();
  }
}
