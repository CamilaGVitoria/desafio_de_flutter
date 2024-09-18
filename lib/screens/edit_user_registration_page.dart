import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserRegistrationPage extends StatefulWidget {
  const EditUserRegistrationPage({Key? key});

  @override
  State<EditUserRegistrationPage> createState() => _EditUserRegistrationPage();
}

class _EditUserRegistrationPage extends State<EditUserRegistrationPage> {
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
      body: ListView(
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
            child: TextField(
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
            child: TextField(
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
              decoration: InputDecoration(
                  label: const Text(
                    'Senha',
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
            child: TextField(
              decoration: InputDecoration(
                  label: const Text(
                    'Confirmar senha',
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  filled: true,
                  fillColor: Colors.greenAccent.shade100),
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
              onPressed: () {
                Get.offNamed('/home');
              },
              child: const Text(
                'Criar usuário',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
