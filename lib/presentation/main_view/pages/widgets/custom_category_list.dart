import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class CustomCategoryList extends StatelessWidget {
  final List<({String job, IconData icon})> services;
  final double radius, size;
  const CustomCategoryList({super.key, required this.services,  this.radius = 35,  this.size = 40});
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(90),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (_, __) => const SizedBox(width: 25),
        itemBuilder: (_, index) => Column(
          children: [
            CircleAvatar(
                radius: radius, backgroundColor: AppColors.primary, child: Icon(services[index].icon, color: AppColors.white, size: size)),
            Text(services[index].job, style: const TextStyle(fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
