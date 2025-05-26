import '../../../../domain/model/my_provider.dart';
import 'package:provider/provider.dart';

import '../../../resources/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> doctors;
  const DetailsScreen({super.key, required this.doctors});
  @override
  Widget build(BuildContext context) {
  var docList = context.read<MyProvider>();
  
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new_rounded)),
          actions: [Icon(Icons.favorite, size: 26, color: AppColors.primary)]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(radius: 60, backgroundImage: AssetImage(doctors['image'])),
              _buildPositionWidget(),
              SizedBox(
                  height: 130,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => _buildCard(),
                      separatorBuilder: (_, __) => SizedBox(width: 30),
                      itemCount: 3)),
              SizedBox(height: MediaQuery.sizeOf(context).height / 3.5, child: _buildInfoWidget(context)),
              ElevatedButton(onPressed: () =>{ 
                docList.getDoctorName(doctors['name']),
                docList.getDoctorField(doctors['specialization']),
                docList.getDoctorDeposit(doctors['price']),
                Get.toNamed(NamedRoutes.bookingAppointment)}, child: Text("Booking Appointment"))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoWidget(BuildContext context) {
    return Column(spacing: 5, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("About", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
      Text(doctors['bio']),
      Spacer(),
      Text("Availability", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
      Text(doctors['working_days']),
      Spacer(),
      Text("Consultation fee", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
      Text('${doctors['price']} EGP')
    ]);
  }

  Widget _buildCard() {
    return SizedBox(
      width: 120,
      height: 150,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Patients", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Icon(Icons.groups, color: AppColors.primary, size: 27),
            Text("500", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildPositionWidget() {
    return Column(spacing: 3, children: [
      Text(doctors['name'], style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
      Text(doctors['specialization']),
      Text("Sheraton Specialized Hospital"),
      Text(" Saqr Quraish Bldg., Sheraton, Misr El Gedeida"),
    ]);
  }
}
