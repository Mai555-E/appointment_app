import 'package:flutter/material.dart';

class TextFormFieldPayment extends StatefulWidget {
  const TextFormFieldPayment({super.key, required this.label, required this.controller});
  final String label;
  final TextEditingController controller;
  @override
  State<TextFormFieldPayment> createState() => _TextFormFieldPaymentState();
}

class _TextFormFieldPaymentState extends State<TextFormFieldPayment> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:  widget.controller,
      decoration:
          InputDecoration(label: Text(widget.label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)), hintText: "lorem ipsum"),
    );
  }
}
