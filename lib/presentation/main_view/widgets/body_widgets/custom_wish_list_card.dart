import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/doctor_model.dart';
import '../../body/details_screen.dart';

class CustomWishListCard
 extends StatelessWidget {
  final String image, name, subtitle, available, star;
  final DoctorModel doctorDetails;
  const CustomWishListCard
(
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
