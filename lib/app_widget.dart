import 'package:flutter/material.dart';

import 'controllers/app_controller.dart';
import 'home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.purple,
              brightness: AppController.instance.switchTheme
                  ? Brightness.dark
                  : Brightness.light),
          home: Homepage(),
        );
      },
    );
  }
}
