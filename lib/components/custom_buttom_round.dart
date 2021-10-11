import 'package:flutter/material.dart';

class CustomButtomRound extends StatelessWidget {
  final String iconData;
  final GestureTapCallback? press;

  const CustomButtomRound(
      {Key? key, required this.iconData, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        child: Image.asset(
          iconData,
          color: Colors.white,
        ),
        height: 50,
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
        primary: Colors.purple,
        shape: const CircleBorder(),
      ),
    );
  }
}
