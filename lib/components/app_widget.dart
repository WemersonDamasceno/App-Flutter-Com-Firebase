import 'package:flutter/material.dart';
import 'package:novo_projeto/helpers/wrapper.dart';
import 'package:novo_projeto/services/login_service.dart';
import 'package:novo_projeto/views/login_page.dart';
import 'package:novo_projeto/views/register_tab.dart';
import 'package:novo_projeto/views/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
            localizationsDelegates: const [
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("pt", "BR"),
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: AppController.instance.switchTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashPage(),
              '/login': (context) => const LoginPage(),
              '/home': (context) => const Homepage(),
              '/register': (context) => const RegisterPage(),
              '/wrapper': (context) => const Wrapper(),
            },
          ),
        );
      },
    );
  }
}
