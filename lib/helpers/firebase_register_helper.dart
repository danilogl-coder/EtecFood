import 'dart:io';

import 'package:etecfood/models/user_model.dart';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRegisterHelper {
  uploadImage(UserModel userModel) async {
    final storageRef = FirebaseStorage.instance.ref();
    final name = "user/${userModel.id}.jpg";

    final photo = storageRef.child(name);

    File file = File(userModel.photograph!);

    try {
      await photo.putFile(file ,SettableMetadata(
    contentType: "image/jpeg",
  ));
    } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }
}
