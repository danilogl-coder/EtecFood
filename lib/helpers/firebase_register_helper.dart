import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/app_store.dart';
import 'package:etecfood/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRegisterHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //Cadastro
  Future<void> signUp({email, senha}) async {
    // ignore: unused_local_variable
    final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: senha);
    autenticado = UserModel(id: result.user!.uid);
  }

  Future<String> uploadImage(String photograph) async {
    final storageRef = FirebaseStorage.instance.ref();

    var parts = photograph.split("/");
    var name = parts.last;
    final path = "user/${parts.last}";

    final photo = storageRef.child(path);

    File file = File(photograph);

    try {
      await photo.putFile(
          file,
          SettableMetadata(
            contentType: "image/jpeg",
          ));
      return name;
    } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }

  salvar(UserModel user) async {
    if (user.photograph != null) {
      user.photograph = await uploadImage(user.photograph!);
    }

    DocumentReference ref = FirebaseFirestore.instance.doc('users/${user.id}');
    ref.set(user.toMap());
  }

  atualizar(UserModel user) async {
    //Função pra salvar os dados
    DocumentReference ref = FirebaseFirestore.instance.doc('users/${user.id}');
    var origin = await ref.get();
    if (user.photograph != null && origin['photograph'] != user.photograph) {
      user.photograph = await uploadImage(user.photograph!);
    }
    ref.set(user.toMap());
  }
}
