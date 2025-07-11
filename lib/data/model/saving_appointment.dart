import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/notification/local_notification_service.dart';
import '../../domain/strip_payment/payment_manager.dart';
import '../../presentation/resources/routes.dart';

class SavingAppointment {
  static Future<void> saveAppointment(BuildContext context ,String date, String time, String name, String field, int price) async {
    final user = Supabase.instance.client.auth.currentUser;
    try {
       await Supabase.instance.client.from('appointments').insert(
          {'user_id': user!.id, 'appointment_date': date, 'appointment_time': time, 'doctor_name': name, 'field': field, 'price': price});

      print(" Appointment saved successfully");
      await PaymentManager.makePayment(price, "egp");

       Navigator.pushNamed(context, NamedRoutes.confirm);
      LocalNotificationService.showNotification(title: "doctor appointment", body: """ you reserve  a $field appointment with doctor :$name \n in date : $date \n and the total deposit is => $price        """);
    } catch (e) {
      print(" Error saving appointment: $e");
    }
  }
}
