import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_constants.dart';

class LocationAndNotification extends StatelessWidget {
  const LocationAndNotification({super.key});
  static String _location = AppConstants.locations.first;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Location Icon
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.location_on, color: AppColors.primary),
            DropdownMenu(
                width: 220,
                menuHeight: 200,
                initialSelection: _location,
                onSelected: (selected) => _location = selected!,
                textStyle: const TextStyle(fontWeight: FontWeight.w500),
                trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                inputDecorationTheme:
                    const InputDecorationTheme(border: InputBorder.none, enabledBorder: InputBorder.none, contentPadding: EdgeInsets.zero),
                dropdownMenuEntries: List.generate(AppConstants.locations.length,
                    (index) => DropdownMenuEntry(value: AppConstants.locations[index], label: AppConstants.locations[index])))
          ],
        ),

        // Notification Icon
        SizedBox.square(
            dimension: 40,
            child: IconButton.filled(
                iconSize: 25,
                onPressed: () {},
                color: AppColors.black,
                icon: const Icon(Icons.notifications_rounded),
                style: IconButton.styleFrom(backgroundColor: AppColors.white)))
      ],
    );
  }
}