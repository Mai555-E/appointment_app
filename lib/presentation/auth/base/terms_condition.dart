import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: _isChecked, activeColor: AppColors.primary, onChanged: (isChecked) => setState(() => _isChecked = isChecked!)),
        Text("Agree with", style: Theme.of(context).textTheme.bodyLarge),
        TextButton(onPressed: () {}, child: const Text("Terms & Condition"))
      ],
    );
  }
}
