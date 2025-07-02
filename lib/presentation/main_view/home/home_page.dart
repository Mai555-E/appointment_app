import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/app_constants.dart';
import '../widgets/home_widgets/carousel_slider_with_dots.dart';
import '../widgets/home_widgets/custom_category_list.dart';
import '../widgets/home_widgets/custom_category_tile.dart';
import '../widgets/home_widgets/custom_search_bar.dart';
import '../widgets/home_widgets/location_and_notification.dart';
import '../widgets/home_widgets/product_cards_home.dart';

class HomePage extends StatelessWidget {
  static RxInt currentIndex = 0.obs;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Location", style: TextStyle(color: Colors.grey)),
                
                  LocationAndNotification(),
                  const SizedBox(height: 10),
                 SizedBox(width: 350,  child: CustomSearchBar())
                ],
              ),
            ),
            CarouselSliderWithDots(currentIndex: currentIndex),
            CustomCategoryTile(title: "Our Services"),
            CustomCategoryList(services: AppConstants.doctorJobs),
            CustomCategoryTile(title: "Next Appointment", subTitle: "See All"),
            ProductCardsHome()
          ],
        ),
      ),
    );
  }
}
