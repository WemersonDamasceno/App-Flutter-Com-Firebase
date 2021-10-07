import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";

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
                  child: TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                    onChanged: (text) {
                      senha = text;
                    },
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      labelText: "Senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.purple,
                      ),
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
                      ElevatedButton(
                        child: const ImageIcon(
                          AssetImage("assets/images/facebook.png"),
                          size: 50,
                          color: Colors.white,
                        ),
                        onPressed: () => {
                          Navigator.popAndPushNamed(context, "/home"),
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          shape: CircleBorder(),
                        ),
                      ),
                      ElevatedButton(
                        child: const ImageIcon(
                          AssetImage("assets/images/instagram.png"),
                          size: 50,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          shape: const CircleBorder(),
                        ),
                      ),
                      ElevatedButton(
                        child: const ImageIcon(
                          AssetImage("assets/images/twitter.png"),
                          size: 50,
                          color: Colors.white,
                        ),
                        onPressed: () => {
                          Navigator.popAndPushNamed(context, "/home"),
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          shape: CircleBorder(),
                        ),
                      ),
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
