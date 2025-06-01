import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import 'booking/appointment_screen.dart';
import 'body/my_whish_list.dart';
import 'home/home_page.dart';
import '../auth/profile/profile.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  bool isSelected(int index) => currentIndex == index;

  static final List<Widget> _pages = [
    const HomePage(),
    const HomePage(),
    const MyWhishListPage(),
    const AppointmentScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[currentIndex],
        floatingActionButton: _buildNavigationBottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Widget _buildNavigationBottomBar() {
    return Container(
      height: 55,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          AppConstants.navigationData.length,
          (index) => IconButton.filled(
              onPressed: () => setState(() => currentIndex = index),
              style: IconButton.styleFrom(
                  iconSize: 20,
                  side: BorderSide.none,
                  fixedSize: const Size.square(45),
                  backgroundColor: isSelected(index) ? Colors.white : Colors.transparent,
                  foregroundColor: isSelected(index) ? AppColors.primary : Colors.grey[700]),
              icon: Icon(isSelected(index) ? AppConstants.navigationData[index].iconFilled : AppConstants.navigationData[index].icon)),
        ),
      ),
    );
  }
}
