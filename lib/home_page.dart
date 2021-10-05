import 'package:flutter/material.dart';
import 'controllers/app_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokédex"),
        actions: [CustomSwitcher()],
      ),
      body: Center(
        child: Text("Mude o tema do app!"),
      ),
    );
  }
}

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
