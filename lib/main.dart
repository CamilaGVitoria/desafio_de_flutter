import 'package:desafio_de_flutter/screens/edit_user_registration_page.dart';
import 'package:desafio_de_flutter/screens/home_page.dart';
import 'package:desafio_de_flutter/screens/login_page.dart';
import 'package:desafio_de_flutter/screens/restricted_page.dart';
import 'package:desafio_de_flutter/screens/user_registration_page.dart';
import 'package:desafio_de_flutter/services/auth_service.dart';
import 'package:desafio_de_flutter/widgets/auth_check.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthService());
      }),
      initialRoute: '/auth_check',
      getPages: [
        GetPage(name: '/auth_check', page: () => AuthCheck()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/new_user', page: () => UserRegistrationPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/restricted', page: () => RestrictedPage()),
        GetPage(name: '/edit_user', page: () => EditUserRegistrationPage()),
      ],
      title: 'Desafio de Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent.shade700),
        useMaterial3: true,
      ),
    );
  }
}
