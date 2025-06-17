import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../widgets/widgets.dart';
import 'base/auth_widgets.dart';
import 'base/supabase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController email, password;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() => {email.dispose(), password.dispose(), super.dispose()};
  @override
  void initState() => {email = TextEditingController(), password = TextEditingController(), super.initState()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 20,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    child: TitleAndSubtitle(title: "sign In", subTitle: "Hi! Welcome back, you've been missed")),
                CustomTextFormField(label: "Email", icon: Icons.email_sharp, hint: 'example@gmail.com', getInfo: email),
                CustomTextFormField(label: "Password", icon: Icons.visibility_off, hint: '***************', getInfo: password),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {}, child: const Text("Forgot Password?", style: TextStyle(color: AppColors.black)))),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await SupabaseAuth.signIn(email: email.text, password: password.text, context: context);
                      }
                    },
                    child: const Text("Sign In")),
                const OrSignWith(label: "in"),
                const SocialIcons(),
                const HaveAnAccount(isSignIn: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
