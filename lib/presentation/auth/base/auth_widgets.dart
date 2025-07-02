import 'package:flutter/material.dart';

import '../../resources/app_assets.dart';
import '../../resources/routes.dart';

class TitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitleAndSubtitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text((title), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Text(subTitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class OrSignWith extends StatelessWidget {
  final String label;
  const OrSignWith({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(children: [
        const Expanded(child: Divider()),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text("Or sign $label with")),
        const Expanded(child: Divider())
      ]),
    );
  }
}

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.apple_rounded, color: Colors.black, size: 50)),
          IconButton.outlined(onPressed: () {}, icon: Image.asset(AppAssets.googleIcon, width: 70)),
          IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.facebook, color: Colors.blue, size: 50)),
        ],
      ),
    );
  }
}

class HaveAnAccount extends StatelessWidget {
  final bool isSignIn;
  const HaveAnAccount({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${isSignIn ? "Don't" : "Already"} have an account?"),
        TextButton(
          child: Text(isSignIn ? "Sign Up" : "Sign In"),
          onPressed: () => Navigator.pushReplacementNamed( context, isSignIn ? NamedRoutes.signUpScreen : NamedRoutes.signInScreen),
        ),
      ],
    );
  }
}
