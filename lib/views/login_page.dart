import 'package:flutter/material.dart';
import 'package:novo_projeto/components/custom_tabs_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //Servico de login do firebase
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF070707),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: 300,
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              //Add as tabs aqui
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  color: Color(0xFFFAFEFC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: TabsLogin(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
