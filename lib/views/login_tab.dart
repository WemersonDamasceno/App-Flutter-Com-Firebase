//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:novo_projeto/components/custom_buttom_round.dart';
import 'package:novo_projeto/components/custom_input_text.dart';
import 'package:novo_projeto/services/auth_firebase_service.dart';
import 'package:novo_projeto/views/home_page.dart';
import 'package:provider/provider.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  String email = "";
  String senha = "";
  bool showPassword = false;
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Servico de login do firebase
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 400,
                      child: CustomInputText(
                        labelText: "Email",
                        onPressIcon: () {},
                        icon: Icons.email_outlined,
                        txtController: emailController,
                        showPassword: false,
                        sufixIcon: null,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 400,
                      child: CustomInputText(
                        labelText: "Senha",
                        icon: Icons.vpn_key_outlined,
                        txtController: senhaController,
                        showPassword: !showPassword,
                        onPressIcon: () {},
                        sufixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                              icon: showPassword
                                  ? Icon(Icons.lock_open,
                                      size: 30,
                                      color: Colors.black.withOpacity(.4))
                                  : Icon(Icons.lock_outline,
                                      size: 30,
                                      color: Colors.black.withOpacity(.4)),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              }),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          AlertDialog alertDialog = const AlertDialog(
                            title: Text("Aguarde um momento!"),
                            elevation: 2.0,
                            content: LinearProgressIndicator(),
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alertDialog;
                              });

                          //Usar o auth
                          await authService.singInWithEmailAndPassword(
                              emailController.text, senhaController.text);
                          Navigator.pushAndRemoveUntil<void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const Homepage()),
                            ModalRoute.withName('/home'),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFBA2D0B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Ou entre com",
                      style: TextStyle(fontSize: 17, color: Colors.black54),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButtomRound(
                              iconData: "assets/images/facebook.png",
                              press: () => {
                                    Navigator.popAndPushNamed(context, "/home")
                                  }),
                          CustomButtomRound(
                              iconData: "assets/images/instagram.png",
                              press: () => {
                                    Navigator.popAndPushNamed(context, "/home")
                                  }),
                          const CustomButtomRound(
                              iconData: "assets/images/twitter.png",
                              press: null),
                        ],
                      ),
                    ),

                    /*RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            children: [
                              const TextSpan(
                                  text: "É novo por aqui?",
                                  style: TextStyle(color: Colors.black54)),
                              TextSpan(
                                text: " Clique aqui!",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage())),
                                style: const TextStyle(
                                  color: Color(0xFFBA2D0B),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),*/
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
goRegister(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
}
*/