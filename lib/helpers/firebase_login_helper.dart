import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/app_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user_model.dart';

class FirebaseLoginHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user;

  FirebaseLoginHelper();

  //Autenticação login
  Future signIn({email, senha}) async {
    final UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: senha);
    user = auth.currentUser;
    autenticado = UserModel(id: result.user!.uid);
    final DocumentSnapshot documentUser =
        await firestore.collection('users').doc(autenticado!.id).get();
    autenticado = UserModel.fromDocument(documentUser);
  }

  //Desloga
  Future<void> signOut() async {
    await auth.signOut();
    autenticado = UserModel();
    Modular.to.pushNamed('/LoginModule/');
  }

  //Conferindo se o usuario esta logado.
  Future<void> checkCurrentUser() async {
    user = auth.currentUser;
    if (user != null) {
      autenticado = UserModel(id: user!.uid);

      //Criei um documento e estou chamando os dados do usuario atravez do id
      final DocumentSnapshot documentUser =
          await firestore.collection('users').doc(autenticado!.id).get();
      autenticado = UserModel.fromDocument(documentUser);
      if (autenticado!.photograph != null) {
        downloadPhoto(autenticado!.photograph);
      }
      //print(autenticado!.name);

      Modular.to.pushNamed('/');
    }
  }

  Future<void> downloadPhoto(photograph) async {
// Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

// Create a reference with an initial file path and name
    final pathReference = storageRef.child("user/$photograph");

    final List<int> data = await pathReference.getData() as List<int>;
    final Directory tempDir = await getTemporaryDirectory();
    
    File file = File("${tempDir.path}/$photograph");
    await file.open(mode: FileMode.write);
    file.writeAsBytes(data);
  }
}
