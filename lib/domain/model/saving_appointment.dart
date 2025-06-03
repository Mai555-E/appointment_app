import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../presentation/resources/routes.dart';
import '../notification/local_notification_service.dart';
import '../strip_payment/payment_manager.dart';

class SavingAppointment {
  static Future<void> saveAppointment(String date, String time, String name, String field, int price) async {
    final user = Supabase.instance.client.auth.currentUser;
    try {
      final response = await Supabase.instance.client.from('appointments').insert(
          {'user_id': user!.id, 'appointment_date': date, 'appointment_time': time, 'doctor_name': name, 'field': field, 'price': price});

      print(" Appointment saved successfully");
      await PaymentManager.makePayment(price, "egp");

      Get.toNamed(NamedRoutes.confirm);
      LocalNotificationService.showNotification(title: "doctor appointment", body: """ you reserve  a $field appointment with doctor :$name \n in date : $date \n and the total deposit is => $price        """);
    } catch (e) {
      print(" Error saving appointment: $e");
    }
  }
}
