import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';
import 'package:novo_projeto/components/custom_input_text.dart';
import 'package:novo_projeto/services/auth_firebase_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String usuario = "";
  String email = "";
  String senha = "";
  bool showPassword = false;
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final usuarioController = TextEditingController();
  final dataController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(validarEmail);
    senhaController.addListener(validarSenha);
    dataController.addListener(formatarData);
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CustomInputText(
                labelText: "Usuário",
                onPressIcon: () {},
                icon: Icons.person,
                txtController: usuarioController,
                showPassword: false,
                sufixIcon: null,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInputText(
                labelText: "Email",
                onPressIcon: () {},
                icon: Icons.email_rounded,
                txtController: emailController,
                showPassword: false,
                sufixIcon: null,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInputText(
                labelText: "Senha",
                icon: Icons.vpn_key_rounded,
                txtController: senhaController,
                showPassword: !showPassword,
                onPressIcon: () {},
                sufixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      icon: showPassword
                          ? Icon(Icons.lock_open,
                              size: 30, color: Colors.black.withOpacity(.4))
                          : Icon(Icons.lock_outline,
                              size: 30, color: Colors.black.withOpacity(.4)),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaskedTextField(
                maskedTextFieldController: dataController,
                mask: "xx/xx/xxxx",
                maxLength: 10,
                keyboardType: TextInputType.number,
                inputDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15.0),
                  labelText: "Data de nascimento",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.date_range_rounded,
                      color: Color(0xFFBA2D0B),
                    ),
                    onPressed: () async {
                      final data = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1930),
                        lastDate: DateTime(2022),
                      );
                      if (data != null) {
                        List<String> dataPt = data.toString().split(" ");
                        List<String> dataConvert = dataPt[0].split("-");
                        setState(() {
                          dataController.text = dataConvert[2] +
                              "/" +
                              dataConvert[1] +
                              "/" +
                              dataConvert[0];
                        });
                      }
                    },
                    color: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 400,
                child: ElevatedButton(
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    //VERIFICAR SE OS CAMPOS ESTÃO PREENCHIDOS
                    //SE SIM ARROXA O NÓ
                    AlertDialog alertDialog = const AlertDialog(
                      title: Text("Aguarde um momento!"),
                      elevation: 2.0,
                      content: LinearProgressIndicator(),
                    );
                    alertDialog.build(context);
                    await authService.createUserWithEmailAndPassword(
                        emailController.text, senhaController.text);
                    Navigator.popAndPushNamed(context, "/home");
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFBA2D0B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validarEmail() {}

  void validarSenha() {}

  void formatarData() {
    print(dataController.text);
  }
}
