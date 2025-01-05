import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class MyButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double textSize;
  final bool isFilledButton;
  final VoidCallback? onTap;

  const MyButton({
    super.key,
    this.width = 200.0,
    this.height = defaultButtonHeight,
    this.text = '',
    this.textSize = 16.0,
    this.isFilledButton = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isFilledButton ? primaryColor : Colors.transparent,
          borderRadius: buttonRadius,
          border: isFilledButton ? null : Border.all(color: primaryColor),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
