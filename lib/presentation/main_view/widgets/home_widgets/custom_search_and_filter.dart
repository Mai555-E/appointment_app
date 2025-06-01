import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class CustomSearchAndFilter extends StatelessWidget {
  const CustomSearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Search Bar
        const SizedBox(
          width: 280,
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                prefixIconColor: AppColors.primary,
                prefixIcon: Icon(Icons.search_rounded),
                hintStyle: TextStyle(fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)))),
          ),
        ),
        const Spacer(),
        // Search Filters
        Container(
            padding: const EdgeInsets.all(0),
            width: 40,
            height: 45,
            decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Icon(Icons.filter_alt_rounded, color: Colors.white))
      ],
    );
  }
}