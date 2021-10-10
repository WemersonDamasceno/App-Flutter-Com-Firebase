import 'package:flutter/material.dart';
import 'package:novo_projeto/services/login_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<LoginService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: const [
            Text("Crie sua conta"),
          ],
        ),
      ),
    );
  }
}
