import 'package:doctor_appointment_app/presentation/resources/routes.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse details) {
    Get.toNamed(NamedRoutes.profilePage);
  }

  static Future init() async {
    InitializationSettings settings = InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static void showNotification({String? title, String? body}) {
    NotificationDetails details =
        NotificationDetails(android: AndroidNotificationDetails("1", "HI User", importance: Importance.max, priority: Priority.high));
    flutterLocalNotificationsPlugin.show(0, title, body, details, payload: "Doctor Mai");
  }
}
