import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_constants.dart';

class CarouselSliderWithDots extends StatelessWidget {
  final RxInt currentIndex;
  const CarouselSliderWithDots({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(210), // CarouselSlider with Dots
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselSlider.builder(
              itemCount: 4,
              itemBuilder: (_, index, __) {
                WidgetsBinding.instance.addPostFrameCallback((_) => currentIndex.value = index);
                return Column(
                  children: [
                    Container(
                      height: 190, // CarouselSlider Height
                      margin: const EdgeInsets.symmetric(horizontal: 17),
                      decoration: const BoxDecoration(color: Color(0xff9bb3dc), borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: SizedBox(
                              width: 145,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Title
                                  Text(AppConstants.carouselSliderData[index].title,
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.white)),
                                  // SubTitle
                                  Text(AppConstants.carouselSliderData[index].subTitle,
                                      style: TextStyle(fontSize: 15, color: Colors.white)),
                                  // Button

                                  SizedBox.fromSize(
                                      size: const Size(115, 36),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                          child: const Text("Meeting online", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600))))
                                ],
                              ),
                            ),
                          ),
                          Image.asset(AppConstants.carouselSliderData[index].images, fit: BoxFit.cover, width: 120, height: 190)
                        ],
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                  height: 190,
                  autoPlay: true,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlayCurve: Curves.easeInOutCubicEmphasized)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Obx(() => Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: currentIndex.value == index ? AppColors.primary : Colors.grey))),
            ),
          )
        ],
      ),
    );
  }
}
