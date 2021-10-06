import 'package:flutter/material.dart';
import '../controllers/app_controller.dart';

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.switchTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
