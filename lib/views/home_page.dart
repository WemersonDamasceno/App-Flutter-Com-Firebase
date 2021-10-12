import 'package:flutter/material.dart';
import 'package:novo_projeto/components/custom_switcher.dart';
import 'package:novo_projeto/services/login_service.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<LoginService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter - CRUD"),
        actions: [
          CustomSwitcher(),
          IconButton(
              onPressed: () async {
                await authService.singOut();
                Navigator.popAndPushNamed(context, "/login");
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("Pagina inicial")],
        ),
      ),
    );
  }
}
