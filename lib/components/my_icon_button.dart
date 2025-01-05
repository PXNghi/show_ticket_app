import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class MyIconButton extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final VoidCallback? onTap;
  const MyIconButton({
    super.key,
    this.width = 35,
    this.height = 35,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: grey46Color,
          shape: BoxShape.circle,
        ),
        child: Center(child: Image.asset(image)),
      ),
    );
  }
}
