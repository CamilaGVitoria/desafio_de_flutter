import 'package:desafio_de_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Get.find<AuthService>();

    return Obx((){
    if (auth.isLoading.value) {
      return loading();
    } else if (auth.usuario.value == null) {
      Future.microtask(() => Get.offNamed('/login'));
      return Container();
    } else {
      Future.microtask(() => Get.offNamed('/home'));
      return Container();
    }});
  }

  Widget loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
