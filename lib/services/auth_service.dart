import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AuthException implements Exception {
  String message;

  AuthException(this.message);
}

class AuthService extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Rxn<User?> usuario = Rxn<User?>();
  RxBool isLoading = true.obs;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    auth.authStateChanges().listen((User? user) {
      usuario.value = user;
      isLoading.value = false;
    });
  }

  getUser() {
    usuario.value = auth.currentUser;
  }

  Future<void> userRegister(String name, String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await user.updateProfile(displayName: name);
        await user.reload();
        getUser();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('Senha muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email já cadaastrado');
      }
    }
    
  }

  login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não cadastrado!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta, tente novamente!');
      } else {
        throw AuthException('Ocorreu um erro ao fazer login. Tente novamente.');
      }
    }
  }

  logout() async {
    await auth.signOut();
    getUser();
  }
  
  Future<void> updateUserName(String newName) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.updateProfile(displayName: newName);
        await user.reload();
        getUser();
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException('Erro ao atualizar o nome de usuário: ${e.message}');
    }
  }
}
