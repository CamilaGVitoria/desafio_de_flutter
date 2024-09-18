import 'package:desafio_de_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key? key});

  @override
  State<EditUserPage> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final AuthService authService = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade700,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.greenAccent.shade700,
        title: const Text(
          'Meu Perfil',
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
            Obx(() {
              final user = authService.usuario.value;

              return Column(children: [
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
                        hintText: user?.displayName ??
                            'Nome de usuário não disponível',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        filled: true,
                        fillColor: Colors.greenAccent.shade100),
                  ),
                ),
              ]);
            }),
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
                      await authService.updateUserName(
                          name.text);
                      Get.offNamed('/home');
                    } on AuthException catch (e) {
                      Get.snackbar('Erro', e.message,
                          backgroundColor: Colors.red);
                    }
                  }
                },
                child: const Text(
                  'Alterar usuário',
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
