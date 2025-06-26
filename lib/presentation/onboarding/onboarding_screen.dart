import 'package:flutter/material.dart';

import '../resources/app_constants.dart';
import '../resources/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() => {_controller = PageController(), super.initState()};

  @override
  void dispose() => {super.dispose(), _controller.dispose()};
  void moveToNextPage(int i) {
    (currentIndex == 3)
        ? Navigator.pushReplacementNamed(context, NamedRoutes.signInScreen)
        : _controller.animateToPage(i, duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          controller: _controller,
          itemCount: AppConstants.onboardingImages.length,
          itemBuilder: (_, i) => _buildPageViewBody(i),
        ),
      ),
    );
  }

  Widget _buildPageViewBody(int i) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: size.height / 7),
      child: Column(
        spacing: 15,
        children: [
          Image.asset(AppConstants.onboardingImages[i].image, height: 300),
          Text(AppConstants.onboardingImages[i].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          Spacer(),
          ElevatedButton(onPressed: () => moveToNextPage(++currentIndex), child: Text("Next")),
          Spacer()
        ],
      ),
    );
  }
}
