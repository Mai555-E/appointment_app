import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/provider/my_provider.dart';
import '../../resources/app_assets.dart';
import '../../resources/app_colors.dart';
import '../../widgets/leading_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController name, email, phone, location, username;

  @override
  void dispose() => {name.dispose(), email.dispose(), username.dispose(), location.dispose(), super.dispose()};

  @override
  void initState() => {
        name = TextEditingController(),
        email = TextEditingController(),
        phone = TextEditingController(),
        username = TextEditingController(),
        location = TextEditingController(),
        super.initState()
      };

  @override
  Widget build(BuildContext context) {
    var data = context.watch<MyProvider>();
    return Scaffold(
      appBar: LeadingAppBar(title: "Account"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            spacing: 35,
            children: [
              _buildTextAndAvatar(data.userEmail ?? "mai123@gmail.com"),
              TextFormField(controller: name, decoration: InputDecoration(label: Text("Named:"), hintText: data.username)),
              TextFormField(controller: email, decoration: InputDecoration(label: Text("Email:"), hintText: data.userEmail)),
              TextFormField(controller: phone, decoration: InputDecoration(label: Text("Phone:"), hintText: data.userPhone)),
              TextFormField(controller: location, decoration: InputDecoration(label: Text("Location:"), hintText: location.text)),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildTextAndAvatar(String email) {
    return Column(spacing: 5, children: [
      CircleAvatar(radius: 55, backgroundImage: AssetImage(AppAssets.doctor1)),
      Text(email, style: TextStyle(color: AppColors.grey))
    ]);
  }
}
