import 'package:supabase_flutter/supabase_flutter.dart';

import 'doctor_model.dart';

class DoctorDataSupabaseModel {
  
  Future<List<DoctorModel>> fetchData() async {
    try {
      final response = await Supabase.instance.client.from('doctors').select();
   final   doctors = response;
      print(response.runtimeType);
      return doctors.map((json)=> DoctorModel.fromJson(json)).toList();
    } catch (e) {
      print(" there is error occurred $e");
      return [];
    }
  }
}
