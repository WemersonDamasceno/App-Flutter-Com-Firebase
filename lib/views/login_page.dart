import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:novo_projeto/components/custom_buttom_round.dart';
import 'package:novo_projeto/components/custom_input_text.dart';
import 'package:novo_projeto/services/login_service.dart';
import 'package:novo_projeto/views/home_page.dart';
import 'package:novo_projeto/views/register_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final authService = Provider.of<LoginService>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                  width: 300,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/logo.jpg"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                            primary: Colors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Ou entre com",
                      style: TextStyle(fontSize: 17),
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
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        children: [
                          const TextSpan(text: "É novo por aqui?"),
                          TextSpan(
                            text: " Clique aqui!",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage())),
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
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

goRegister(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
}
