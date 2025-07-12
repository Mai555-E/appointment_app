import 'package:flutter/material.dart';

class CustomAppointmentTextFormField extends StatelessWidget {
  const CustomAppointmentTextFormField({super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: InputDecoration(
        hintText: "Spring code",
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
    );
  }
}
