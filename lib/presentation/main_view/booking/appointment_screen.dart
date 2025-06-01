import 'package:flutter/material.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_constants.dart';
import '../widgets/custom_calender_table.dart';
import '../widgets/custom_category_list.dart';
import '../widgets/custom_category_tile.dart';
import '../widgets/custom_search_bar.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
             children: [
            Text("Schedule", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600)),
            CustomSearchBar(),
            CustomCategoryList(services: AppConstants.servicesTypes, radius: 30, size: 30),
            CustomCalenderTable(),
           
            CustomCategoryTile(title: 'Up coming schedule'),
            _buildAppointmentCard(context),

          ]),
        ),
      ),
    );
  }

  SizedBox _buildAppointmentCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.2,
      height: 150,
      child: Card(
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AppAssets.doctor1, height: 130),
            Column(
              spacing: 8,
              children: [
                Text("Dr. Sarah Johnson", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Text("Cardiologist", style: TextStyle(fontSize: 16)),
                Text("Nov 19 -Thu", style: TextStyle(fontSize: 15, color: AppColors.primary)),
              ],
            ),
            IconButton.filled(
                onPressed: () {},
                icon: Icon(Icons.call),
                iconSize: 21,
                style: ButtonStyle(
                    maximumSize: WidgetStatePropertyAll(Size.fromRadius(21)), backgroundColor: WidgetStatePropertyAll(AppColors.primary)))
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Icon(Icons.menu, size: 25),
      actions: [CircleAvatar(radius: 20, backgroundImage: AssetImage(AppAssets.doctor1))],
    );
  }
}
