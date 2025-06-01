import 'package:flutter/material.dart';

class CustomPositionWidgets extends StatelessWidget {
  final Map<String, dynamic> doctors;
  const CustomPositionWidgets({super.key,required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 3, children: [
      Text(doctors['name'], style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
      Text(doctors['specialization']),
      Text("Sheraton Specialized Hospital"),
      Text(" Saqr Quraish Bldg., Sheraton, Misr El Gedeida"),
    ]);
  }
}
