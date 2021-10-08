import 'package:flutter/material.dart';
import 'package:novo_projeto/components/custom_buttom_round.dart';
import 'package:novo_projeto/components/custom_input_text.dart';

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

    emailController.addListener(validarEmail);
    senhaController.addListener(validarSenha);
  }

  validarSenha() {
    setState(() {
      senha = senhaController.text;
    });
    //validar senha
  }

  validarEmail() {
    setState(() {
      email = emailController.text;
    });
    //TODO Validar email
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: 300,
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: SizedBox(
                      height: 50,
                      width: 400,
                      child: CustomInputText(
                        labelText: "Email",
                        icon: Icons.email_outlined,
                        txtController: emailController,
                        showPassword: false,
                        sufixIcon: null,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: CustomInputText(
                    labelText: "Senha",
                    icon: Icons.lock_outline_rounded,
                    txtController: senhaController,
                    showPassword: true,
                    sufixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                          icon: showPassword
                              ? Icon(Icons.remove_red_eye,
                                  size: 30, color: Colors.black.withOpacity(.4))
                              : Icon(Icons.remove_red_eye_outlined,
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
                    onPressed: () => {
                      Navigator.of(context).pushNamed("/home"),
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
                          press: () =>
                              {Navigator.popAndPushNamed(context, "/home")}),
                      CustomButtomRound(
                          iconData: "assets/images/instagram.png",
                          press: () =>
                              {Navigator.popAndPushNamed(context, "/home")}),
                      CustomButtomRound(
                          iconData: "assets/images/twitter.png",
                          press: () =>
                              {Navigator.popAndPushNamed(context, "/home")}),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("Ainda não tem conta? Crie sua conta aqui!",
                    textAlign: TextAlign.end),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
