import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/app_store.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class FirebaseLoginHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  UserModel? userModel;

  FirebaseLoginHelper() {
    checkCurrentUser();
  }

  //Autenticação login
  Future signIn({email, senha}) async {
    final UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: senha);
    autenticado = UserModel(id: result.user!.uid);
  }

  //Cadastro
  Future<void> signUp({email, senha}) async {
    // ignore: unused_local_variable
    final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: senha);
    autenticado = UserModel(id: result.user!.uid);
  }

  //Conferindo se o usuario esta logado.
  Future<void> checkCurrentUser() async {
    final user = auth.currentUser;
    if (user != null) {
      autenticado = UserModel(id: user.uid);
      
      //Criei um documento e estou chamando os dados do usuario atravez do id
      final DocumentSnapshot documentUser = 
      await firestore.collection('users').doc(autenticado!.id).get();
      userModel = UserModel.fromDocument(documentUser);
      print(userModel!.name);

    }
  }
}
