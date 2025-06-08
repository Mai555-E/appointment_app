import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/doctor_data_supabase_model.dart';
import '../../../data/model/doctor_model.dart';
import '../../../domain/doc_services/doctor_services.dart';
import '../../../domain/provider/my_provider.dart';
import '../../widgets/leading_app_bar.dart';
import '../widgets/body_widgets/custom_wish_list_card.dart';

class MyWhishListPage extends StatelessWidget {
  const MyWhishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorServices services = DoctorServices(DoctorDataSupabaseModel());
  
    
    return Scaffold(
      appBar: LeadingAppBar(title: "All doctors"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 1.2,
          child: FutureBuilder<List<DoctorModel>>(
            future: services.getAllDoctorData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No data available"));
              }

              final doctors = snapshot.data!;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<MyProvider>().setDoctorModelData(doctors);
              });
              return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.7,
                  children: List.generate(doctors.length, (i) {
                    final doc = doctors[i];
                    
                    return CustomWishListCard(
                        doctorDetails: doc,
                        star: "\u{2B50}",
                        image: doc.image,
                        name: doc.name,
                        subtitle: doc.specialization,
                        available: doc.working_days);
                  }).toList());
            },
          ),
        ),
      ),
          
    );
  }
}
