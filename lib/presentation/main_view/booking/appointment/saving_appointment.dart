import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../resources/routes.dart';

class SavingAppointment {
  static Future<void> saveAppointment(String date, String time, String name, String field) async {
    final user = Supabase.instance.client.auth.currentUser;
    try {
      final response = await Supabase.instance.client
          .from('appointments')
          .insert({'user_id': user!.id, 'appointment_date': date, 'appointment_time': time, 'doctor_name': name, 'field': field});

      print(" Appointment saved successfully");
      Get.toNamed(NamedRoutes.confirm);
    } catch (e) {
      print(" Error saving appointment: $e");
    }

  }
}
