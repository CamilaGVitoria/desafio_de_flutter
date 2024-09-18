import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class RestrictedPage extends StatefulWidget {
  const RestrictedPage({Key? key});

  @override
  State<RestrictedPage> createState() => __RestrictedPage();
}

class __RestrictedPage extends State<RestrictedPage> {
    final AuthService authService = Get.find<AuthService>();

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
            Obx(() {
              final user = authService.usuario.value;
              return UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text(
                  user?.displayName ?? 'Nome de usuário não disponível',
                  style: const TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  user?.email ?? 'Email não disponível',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.greenAccent.shade700),
              );
            }),
            ListTile(
              title: const Text('Meu Perfil'),
              leading: const Icon(Icons.account_circle_rounded),
              onTap: () {
                Get.toNamed('/edit_user');
              },
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Get.offNamed('/home');
              },
            ),
            ListTile(
              title: const Text(
                'Sair',
                style: TextStyle(color: Colors.red),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onTap: () {
                authService.logout();
                Get.offNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
