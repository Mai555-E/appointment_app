import 'package:flutter/material.dart';

import '../../widgets/leading_app_bar.dart';
import '../../../domain/model/supabase_model.dart';
import '../widgets/body_widgets/custom_wish_list_card.dart';

class MyWhishListPage extends StatelessWidget {
  const MyWhishListPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: LeadingAppBar(title: "All doctors"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 1.2,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: SupabaseModel.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No data available"));
              }

              final doctors = snapshot.data!;
           
              return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.7,
                  children: doctors.map((doctor) {
                    return CustomWishListCard
(
                        doctorDetails: doctor,
                        star: "\u{2B50}",
                        image: doctor['image'],
                        name: doctor['name'],
                        subtitle: doctor['specialization'],
                        available: doctor['working_days']);
                  }).toList());
            },
            
          ),
        ),
      ),
    );
  }
}

