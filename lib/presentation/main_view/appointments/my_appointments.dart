import 'package:flutter/material.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_colors.dart';
import '../../widgets/leading_app_bar.dart';
import 'custom_text_form_field.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LeadingAppBar(title: "Appointment"),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(spacing: 15, crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildAppointmentCard(),
              Text("Promo Code", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              CustomAppointmentTextFormField(),
              _buildTextRow(title: "Total Cost", price: 500),
              _buildTextRow(title: "Total Discount", price: 150),
              Divider(color: AppColors.lightGrey),
              _buildTextRow(title: "Total Discount", price: 350),
              Spacer(),
              Flexible(flex: 3, child: ElevatedButton(onPressed: () {}, child: Text("Pay", style: TextStyle(fontSize: 20)))),
            ])));
  }

  Row _buildTextRow({required String title, required double price}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.secondary)),
      Text("EGP - $price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.secondary))
    ]);
  }

  Widget _buildAppointmentCard() {
    return Row(
      spacing: 20,
      children: [
        Card(color: AppColors.lightGrey, child: Image.asset(AppAssets.doctor4, height: 110)),
        Column(
          children: [
            Text("Dr.James Wilson", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
            Text("Dentist", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            Row(spacing: 3, children: [Text("★", style: TextStyle(color: Colors.amber, fontSize: 22)), Text("75 (Reviews)")])
          ],
        )
      ],
    );
  }
}
