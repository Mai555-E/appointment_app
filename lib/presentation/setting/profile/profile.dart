import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/provider/my_provider.dart';
import '../../../domain/shared_preferences/my_shared_preferences.dart';
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
                _buildTextAndAvatar( ),
                ProfileTextFormField(hint:MySharedPreferences.getUserName, label: "Named:", controller: name),
                ProfileTextFormField(hint: MySharedPreferences.getUserEmail, label: "Email:", controller: email),
                ProfileTextFormField(hint:  MySharedPreferences.getUserPhone, label: "Phone:", controller: phone),
                ProfileTextFormField(hint: MySharedPreferences.getUserLocation, label: "Location:", controller: location),
                ElevatedButton(
                    onPressed: () async {
                      if (form.currentState!.validate()) {
                        var response = await MySharedPreferences.saveProfileData(name: name.text, email: email.text, phone: phone.text, location: location.text, username: username.text);
                        if(response){
                          ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Data saved successfully"), backgroundColor: AppColors.thirdColor));
                            
                        Navigator.popAndPushNamed(context, NamedRoutes.mainView);
                        }else {
                          ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Data didn't saved "), backgroundColor: AppColors.thirdColor));
                        }
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

  Widget _buildTextAndAvatar( ) {
    return Consumer<MyProvider>(
      builder: (context, value, child) => SizedBox(
      
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
          CircleAvatar(radius: 75, backgroundImage: (value.imageFile != null) ? FileImage(value.imageFile!) : AssetImage(AppAssets.doctor1)),
          Positioned(
              bottom: 0,
              right: 0,
              child: IconButton.filled(
                  onPressed: () => value.pickedImage(),
                  icon: Icon(Icons.edit, size: 18),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.primary), maximumSize: WidgetStatePropertyAll(Size.fromRadius(20))))),
        ]),
      ),
    );
  }
}
