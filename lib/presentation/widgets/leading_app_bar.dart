import 'package:flutter/material.dart';

class LeadingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const LeadingAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      title: title != null ? Text(title!) : null,
      leading: IconButton.outlined(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          style: IconButton.styleFrom(fixedSize: const Size.square(10))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
