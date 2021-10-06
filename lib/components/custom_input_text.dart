import 'package:flutter/material.dart';

class CustomInputText extends StatefulWidget {
  final String? labelText;
  final TextInputType tipoInput;
  final IconData icon;
  final String value;

  const CustomInputText(
      {Key? key,
      this.labelText,
      required this.tipoInput,
      required this.icon,
      required this.value})
      : super(key: key);

  @override
  _CustomInputTextState createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  _CustomInputTextState();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        //widget.value = text;
      },
      keyboardType: widget.tipoInput,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(20.0),
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        prefixIcon: Icon(
          Icons.email_rounded,
          color: Colors.purple,
        ),
      ),
    );
  }
}
