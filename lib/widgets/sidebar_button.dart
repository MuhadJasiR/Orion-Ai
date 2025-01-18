import 'package:flutter/material.dart';
import 'package:orion_ai/theme/colors.dart';

class SidebarButton extends StatelessWidget {
  const SidebarButton({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.text,
  });

  final bool isCollapsed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.iconGrey,
        ),
        isCollapsed ? const SizedBox() : const SizedBox(width: 10),
        isCollapsed ? const SizedBox() : Text(text)
      ],
    );
  }
}
