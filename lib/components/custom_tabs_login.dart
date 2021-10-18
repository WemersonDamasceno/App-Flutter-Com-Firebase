import 'package:flutter/material.dart';
import 'package:novo_projeto/views/login_tab.dart';
import 'package:novo_projeto/views/register_tab.dart';

class TabsLogin extends StatefulWidget {
  const TabsLogin({Key? key}) : super(key: key);

  @override
  _TabsLoginState createState() => _TabsLoginState();
}

class _TabsLoginState extends State<TabsLogin> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Colors.red,
          isScrollable: true,
          tabs: [
            Tab(
              text: "Entrar",
            ),
            Tab(
              text: "Criar conta",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            LoginTab(),
            RegisterPage(),
          ],
        ),
      ),
    );
  }
}
