import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/model/supabase_model.dart';
import '../../../widgets/leading_app_bar.dart';
import 'details_screen.dart';

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
                    return CustomCard(
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

class CustomCard extends StatelessWidget {
  final String image, name, subtitle, available, star;
  final Map<String, dynamic> doctorDetails;
  const CustomCard(
      {super.key,
      required this.star,
      required this.image,
      required this.name,
      required this.subtitle,
      required this.available,
      required this.doctorDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 45, backgroundImage: AssetImage(image)),
            Text("$star $star $star $star"),
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text(subtitle, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300), textAlign: TextAlign.center),
            Text(available, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300), textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(onPressed: () => Get.to(() => DetailsScreen(doctors: doctorDetails)), child: const Text("Appointment")),
            )
          ],
        ),
      ),
    );
  }
}
