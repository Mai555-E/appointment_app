import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resources/app_colors.dart';

class CustomCircularAvatarIcons extends StatelessWidget {
  const CustomCircularAvatarIcons({super.key, this.radius, required this.icon, this.size});

  final double? radius;
  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundColor: AppColors.primary, child: FaIcon(icon, size: size, color: AppColors.white));
  }
}
