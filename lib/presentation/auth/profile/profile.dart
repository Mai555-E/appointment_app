import 'package:doctor_appointment_app/presentation/auth/profile/profile_validation.dart';
import 'package:doctor_appointment_app/presentation/resources/routes.dart';
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
  final form = GlobalKey<FormState>();
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
          child: Form(
            key: form,
            child: Column(
              spacing: 35,
              children: [
                _buildTextAndAvatar(data.userEmail ?? "anas123@gmail.com"),
                ProfileTextFormField(hint: "anas", label: "Named:", controller: name),
                ProfileTextFormField(hint: "anas123@gmail.com", label: "Email:", controller: email),
                ProfileTextFormField(hint: "0123456789", label: "Phone:", controller: phone),
                ProfileTextFormField(hint: "Cairo", label: "Location:", controller: location),
                ElevatedButton(
                    onPressed: () async {
                      if (form.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data saved successfully"), backgroundColor: AppColors.thirdColor,));
                        Navigator.popAndPushNamed(context, NamedRoutes.mainView);
                      }
                    },
                    child: Text("Save"))
              ],
            ),
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
