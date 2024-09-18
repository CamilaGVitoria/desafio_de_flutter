import 'package:desafio_de_flutter/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final AuthService authService = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade700,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      label: const Text(
                        'E-mail',
                        style: TextStyle(color: Colors.grey),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.greenAccent.shade100,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: const Text(
                          'Senha',
                          style: TextStyle(color: Colors.grey),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        filled: true,
                        fillColor: Colors.greenAccent.shade100),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 190,
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await authService.login(email.text, password.text);

                          Get.offNamed('/home');
                        } on AuthException catch (e) {
                          Get.snackbar('Erro', e.message);
                        } catch (e) {
                          Get.snackbar('Erro', 'Ocorreu um erro inesperado.');
                        }
                      }
                    },
                    child: const Text(
                      'Fazer Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/new_user');
                    },
                    child: const Text(
                      'Novo Usuário',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
