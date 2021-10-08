import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final TextInputType type;
  final String labelText;
  final IconData icon;
  final TextEditingController txtController;
  final bool showPassword;
  final Widget? sufixIcon;

  const CustomInputText({
    Key? key,
    this.type = TextInputType.text,
    required this.labelText,
    required this.icon,
    required this.txtController,
    required this.showPassword,
    required this.sufixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPassword,
      controller: txtController,
      keyboardType: type,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.purple,
        ),
        suffixIcon: sufixIcon,
      ),
    );
  }
}
