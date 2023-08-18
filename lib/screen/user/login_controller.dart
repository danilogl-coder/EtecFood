import 'package:etecfood/helpers/firebase_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_cubit.dart';

class LoginController {
  final LoginCubit loginCubit;

  final FirebaseUserHelper helper;

  LoginController(this.helper, this.loginCubit);
  autenticar({required email, required senha}) async {
    await helper.signIn(email: email, senha: senha);
  }
/*
  Future<void> loadCurrentUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        currentUser = user;
        debugPrint(currentUser!.uid);
      }
      notifyListeners();
    });
  }*/
}
