import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestrictedPage extends StatefulWidget {
  const RestrictedPage({Key? key});

  @override
  State<RestrictedPage> createState() => __RestrictedPage();
}

class __RestrictedPage extends State<RestrictedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Area Restrita',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.green.shade50,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              accountName: Text('Nome'),
              accountEmail: Text('Email'),
              decoration: BoxDecoration(color: Colors.greenAccent.shade700),
            ),
            ListTile(
              title: Text('Meu Perfil'),
              leading: Icon(Icons.account_circle_rounded),
              onTap: () {
                Get.toNamed('/edit_user');
              },
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.lock),
              onTap: () {
                Get.offNamed('/home');
              },
            ),
            ListTile(
              title: Text('Validar Email'),
              leading: Icon(Icons.mail_lock),
              onTap: () {},
            ),
            ListTile(
              title: Text('Sair'),
              leading: Icon(Icons.logout),
              onTap: () {
                Get.offNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
