import '../../data/model/doctor_data_supabase_model.dart';
import '../../data/model/doctor_model.dart';

class DoctorServices {
 final DoctorDataSupabaseModel data;

  DoctorServices(this.data);

 Future<List<DoctorModel>> getAllDoctorData() async {
  return await data.fetchData();
}
}
