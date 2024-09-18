import 'package:desafio_de_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({Key? key});

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPage();
}

class _UserRegistrationPage extends State<UserRegistrationPage> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final AuthService authService = Get.put(AuthService());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade700,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.greenAccent.shade700,
        title: const Text(
          'Novo Usuário',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            GestureDetector(
              child: Container(
                  width: 100,
                  height: 120,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 30,
                  )),
              onTap: () {},
            ),
            Container(
              padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    label: const Text(
                      'Nome',
                      style: TextStyle(color: Colors.grey),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    filled: true,
                    fillColor: Colors.greenAccent.shade100),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: TextFormField(
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
              child: TextFormField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    label: const Text(
                      'Senha',
                      style: TextStyle(color: Colors.grey),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    filled: true,
                    fillColor: Colors.greenAccent.shade100),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe uma senha!';
                  } else if (value.length < 6) {
                    return 'Digite uma senha com no minimo 6 caracteres!';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: TextFormField(
                obscureText: true,
                controller: confirmPassword,
                decoration: InputDecoration(
                  label: const Text(
                    'Confirmar senha',
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
                validator: (value) {
                  if (password.text != confirmPassword.text) {
                    return 'As senhas não coincidem!';
                  } 
                },
              ),
            ),
            Container(
              height: 80,
              width: 190,
              padding: const EdgeInsets.only(top: 40, right: 50, left: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await authService.userRegister(name.text, email.text, password.text);
                      Get.offNamed('/login');
                    } on AuthException catch (e) {
                      Get.snackbar('Erro', e.message, backgroundColor: Colors.red);
                    }
                  }
                },
                child: const Text(
                  'Criar usuário',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
