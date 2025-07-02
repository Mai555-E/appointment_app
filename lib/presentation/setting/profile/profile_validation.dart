import 'package:flutter/material.dart';

import '../../auth/base/validation.dart';

class ProfileTextFormField extends StatefulWidget {
  final String hint, label;
  final TextEditingController controller;
  const ProfileTextFormField({super.key, required this.hint, required this.label, required this.controller});

  @override
  State<ProfileTextFormField> createState() => _ProfileTextFormFieldState();
}

class _ProfileTextFormFieldState extends State<ProfileTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(hintText: widget.hint,
      hintStyle: TextStyle(fontWeight: FontWeight.w300),
       labelText: widget.label),
      validator: (val) => Validation.validate(val: val!, fieldName: widget.label),
    );
  }
}
