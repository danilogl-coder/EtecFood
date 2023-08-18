import 'package:etecfood/app_store.dart';
import 'package:etecfood/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signIn({required email, required senha}) async {
    final UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: senha);
    autenticado = UserModel(id: result.user!.uid);
  }
}
