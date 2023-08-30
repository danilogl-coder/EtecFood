import 'package:etecfood/app_store.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class FirebaseLoginHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseLoginHelper() {
    checkCurrentUser();
  }

  Future signIn({email, senha}) async {
    final UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: senha);
    autenticado = UserModel(id: result.user!.uid);
  }

  Future<void> signUp({email, senha}) async {
    // ignore: unused_local_variable
    final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: senha);
    autenticado = UserModel(id: result.user!.uid);
  }

  Future<void> checkCurrentUser() async {
    final user = auth.currentUser;
    if (user != null) {
      autenticado = UserModel(id: user.uid);
      print("O Id atual é : ${autenticado!.id}");
    }
  }
}
