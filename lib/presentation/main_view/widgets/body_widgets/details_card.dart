import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
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
}