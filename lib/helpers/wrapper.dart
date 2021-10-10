import 'package:flutter/material.dart';
import 'package:novo_projeto/services/login_service.dart';
import 'package:novo_projeto/views/home_page.dart';
import 'package:novo_projeto/views/login_page.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<LoginService>(context);

    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? const LoginPage() : const Homepage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
