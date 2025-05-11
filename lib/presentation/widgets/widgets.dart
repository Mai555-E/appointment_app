import '../../domain/model/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/base/validation.dart';
import '../resources/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final TextEditingController getInfo;
  const CustomTextFormField({super.key, required this.label, this.icon, required this.hint, required this.getInfo});
  bool _isPassword() => ((label.toLowerCase() == "password") || (label.toLowerCase() == "confirmed password"));
  IconData _getVisibleIcon(IconData icon) =>
      (!_isPassword() || icon == Icons.visibility) ? Icons.visibility_off_outlined : Icons.visibility;
  IconData? _getSuffixIcon(IconData visibleIcon) => _isPassword() ? (_getVisibleIcon(visibleIcon)) : icon!;
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, value, child) {
      return TextFormField(
        onTap: () {
          if (_isPassword()) {
            value.changeIcon();
          }
        },
        obscureText: (_isPassword() && value.obscure),
        controller: getInfo,
        decoration: InputDecoration(
            hintMaxLines: 1, hintText: hint, label: Text(label), suffixIcon: Icon(_getSuffixIcon(value.icons), color: AppColors.primary)),
        validator: (val) => Validation.validate(val: val!, fieldName: label),
      );
    });
  }
}
