import 'package:flutter/material.dart';

import '../../../../data/model/doctor_data_supabase_model.dart';
import '../../../../domain/doc_services/doctor_services.dart';
import '../../../resources/app_colors.dart';

class ProductCardsHome extends StatelessWidget {
  const ProductCardsHome({super.key});

 static DoctorServices allDoctorData = DoctorServices(DoctorDataSupabaseModel());
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(500),
      child: FutureBuilder(
        future: allDoctorData.getAllDoctorData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text(" Error ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text(" No data Available");
          }
          final doctors = snapshot.data;
          
          return GridView.builder(
            itemCount: doctors!.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .82, mainAxisSpacing: 12, crossAxisSpacing: 13),
            itemBuilder: (_, i) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image
                Container(
                    width: 170,
                    height: 147,
                    decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(doctors[i].image, fit: BoxFit.fitHeight)),

                // Product Name & Score
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(doctors[i].specialization), Text("\u{2B50} 4.9", style: TextStyle(color: Colors.grey))],
                ),

                // Price
                Text(doctors[i].working_days)
              ],
            ),
          );
        },
      ),
    );
  }
}
