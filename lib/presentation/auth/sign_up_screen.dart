import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/provider/my_provider.dart';
import '../widgets/widgets.dart';
import 'base/auth_widgets.dart';
import 'base/supabase_auth.dart';
import 'base/terms_condition.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static late final email, userName, phone, password;

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() => {email.dispose(), phone.dispose(), password.dispose(), userName.dispose(), super.dispose()};
  @override
  void initState() => {
        email = TextEditingController(),
        userName = TextEditingController(),
        password = TextEditingController(),
        phone = TextEditingController(),
        super.initState()
      };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 25,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: TitleAndSubtitle(
                        title: "Create Account", subTitle: "Fill your information below\nor register with your social account")),
                CustomTextFormField(label: "Name", icon: Icons.person_rounded, hint: 'Mai', getInfo: userName),
                CustomTextFormField(label: "Email", icon: Icons.email_sharp, hint: 'example@gmail.com', getInfo: email),
                CustomTextFormField(label: "Password", icon: Icons.visibility_off, hint: '***************', getInfo: password),
                CustomTextFormField(label: "Phone", icon: Icons.phone, hint: '', getInfo: phone),
                const TermsAndCondition(),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        context.read<MyProvider>().getUserInfo(userName.text, email.text, phone.text);
                        await SupabaseAuth.signUp(email: email.text, password: password.text, username: userName.text, context: context);
                      }
                    },
                    child: const Text("Sign Up")),
                const OrSignWith(label: "up"),
                const SocialIcons(),
                const HaveAnAccount(isSignIn: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
