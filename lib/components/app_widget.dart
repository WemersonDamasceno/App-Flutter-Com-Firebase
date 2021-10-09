import 'package:flutter/material.dart';
import 'package:novo_projeto/services/login_service.dart';
import 'package:novo_projeto/views/login_page.dart';
import 'package:novo_projeto/wrapper.dart';
import 'package:provider/provider.dart';

import '../controllers/app_controller.dart';
import '../views/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            Provider<LoginService>(
              create: (_) => LoginService(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.purple,
              brightness: AppController.instance.switchTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const Wrapper(),
              '/login': (context) => const LoginPage(),
              '/home': (context) => const Homepage(),
            },
          ),
        );
      },
    );
  }
}
