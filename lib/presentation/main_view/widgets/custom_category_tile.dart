import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../body/my_whish_list.dart';

class CustomCategoryTile extends StatelessWidget {
  final String title, subTitle;
  const CustomCategoryTile({super.key, required this.title,  this.subTitle = 'See more'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
          TextButton(
              onPressed: () => (subTitle == "See All") ? Get.to(() =>MyWhishListPage ()) : null,
              style: TextButton.styleFrom(alignment: Alignment.centerRight, textStyle: const TextStyle(decoration: TextDecoration.none)),
              child: Text(subTitle, style: TextStyle(fontSize: 15)))
        ],
      ),
    );
  }
}
