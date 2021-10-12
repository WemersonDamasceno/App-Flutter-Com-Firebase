import 'package:flutter/material.dart';
import '../controllers/app_controller.dart';

class CustomSwitcher extends StatefulWidget {
  const CustomSwitcher({Key? key}) : super(key: key);

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.switchTheme,
      onChanged: (value) {
        setState(() {
          AppController.instance.changeTheme();
        });
      },
    );
  }
}
