import 'package:flutter/material.dart';

import '../auth/base/validation.dart';
import '../resources/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final TextEditingController getInfo;
  const CustomTextFormField({super.key, required this.label, this.icon, required this.hint, required this.getInfo});

  bool _isPassword() => ((label == "Password" )|| (label == "Confirmed Password"));

  IconData? _getSuffixIcon() => _isPassword() ? Icons.visibility_off_rounded : icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isPassword(),
      controller: getInfo,
      decoration: InputDecoration(hintMaxLines: 1, hintText: hint, label: Text(label), suffixIcon: Icon(_getSuffixIcon(), color: AppColors.primary,)),
      validator:(val)=> Validation.validate(val: val!, fieldName: label),
    );
  }

 
}
