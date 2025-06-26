import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/provider/my_provider.dart';
import '../../resources/app_assets.dart';
import '../../resources/app_colors.dart';
import '../../resources/routes.dart';
import '../../widgets/leading_app_bar.dart';
import 'profile_validation.dart';

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
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Data saved successfully"),
                          backgroundColor: AppColors.thirdColor,
                        ));
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

  Widget _buildTextAndAvatar(String email) {
    var imageProvider = Provider.of<MyProvider>(context);
    var image = imageProvider.imageFile;
    return Consumer<MyProvider>(
      builder: (context, value, child) => Stack(children: [
        CircleAvatar(radius: 75, backgroundImage: (value.imageFile != null) ? FileImage(value.imageFile!) : AssetImage(AppAssets.doctor1)),
        Positioned(
            bottom: 0,
            right: 0,
            child: IconButton.filled(
                onPressed: () => value.pickedImage(),
                icon: Icon(Icons.edit, size: 18),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.primary), maximumSize: WidgetStatePropertyAll(Size.fromRadius(20))))),
        Text(email, style: TextStyle(color: AppColors.grey))
      ]),
    );
  }
}
