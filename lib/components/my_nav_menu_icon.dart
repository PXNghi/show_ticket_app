import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class IconNavMenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String icon;
  final String label;
  final bool isActive;
  const IconNavMenuButton(
      {super.key,
      this.onTap,
      required this.icon,
      required this.label,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, width: 24, height: 24,),
          const SizedBox(height: 2.0),
          Text(
            label,
            style: TextStyle(color: isActive ? primaryColor : greyC5Color, fontSize: 12),
          )
        ],
      ),
    );
  }
}
