import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseModel {
  static List<Map<String, dynamic>> doctors = [];
  static Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await Supabase.instance.client.from('doctors').select();
      doctors = response;
      print(response.runtimeType);
      return doctors;
    } catch (e) {
      print(" there is error occurred $e");
      return [];
    }
  }
}
