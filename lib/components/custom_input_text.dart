import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final TextInputType type;
  final String labelText;
  final IconData? icon;
  final TextEditingController? txtController;
  final bool showPassword;
  final Widget? sufixIcon;
  final GestureTapCallback? onPressIcon;

  const CustomInputText({
    Key? key,
    this.type = TextInputType.text,
    required this.labelText,
    required this.icon,
    required this.txtController,
    required this.showPassword,
    required this.sufixIcon,
    this.onPressIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: TextField(
        obscureText: showPassword,
        controller: txtController,
        keyboardType: type,
        cursorColor: const Color(0xFFBA2D0B),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          labelText: labelText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          prefixIcon: IconButton(
            icon: Icon(icon),
            onPressed: onPressIcon,
            color: const Color(0xFFBA2D0B),
          ),
          suffixIcon: sufixIcon,
        ),
      ),
    );
  }
}
