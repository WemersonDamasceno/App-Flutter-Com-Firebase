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
      inactiveThumbImage: const NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/1434/1434012.png'),
      activeThumbImage: const NetworkImage(
          'https://images.vexels.com/media/users/3/145137/isolated/preview/e6a965902c88e80552d448aa33cab165-icone-de-raios-nitidos-de-sol.png'),
      value: AppController.instance.switchTheme,
      onChanged: (value) {
        setState(() {
          AppController.instance.changeTheme();
        });
      },
    );
  }
}
