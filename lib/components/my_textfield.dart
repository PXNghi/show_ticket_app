import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? textController;
  const MyTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.textController,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: widget.textController,
          obscureText: widget.isPassword && isPasswordHidden,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      child: Image.asset(
                        isPasswordHidden ? eyeOpenIcon : eyeClosedIcon,
                      ),
                    ),
                  )
                : null,
            enabled: true,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
              borderRadius: buttonRadius,
              borderSide: BorderSide(color: primaryColor, width: 3),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: buttonRadius,
            ),
          ),
        ),
      ],
    );
  }
}
