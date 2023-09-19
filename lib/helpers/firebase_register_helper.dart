import 'dart:io';

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

  uploadImage(UserModel userModel) async {
    final storageRef = FirebaseStorage.instance.ref();
    final name = "user/${userModel.id}.jpg";

    final photo = storageRef.child(name);

    File file = File(userModel.photograph!);

    try {
      await photo.putFile(
          file,
          SettableMetadata(
            contentType: "image/jpeg",
          ));
    } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }
}
