import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.phoneNumber,
      this.cpf,
      this.photograph});
  
  UserModel.fromDocument(DocumentSnapshot documentUser)
  {
    id = documentUser.id;
    name = documentUser.get('name');
    email = documentUser.get('email');
    phoneNumber = documentUser.get('phoneNumber');
    cpf = documentUser.get('cpf');

  }


  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  String? cpf;
  String? photograph;

  //Função pra salvar os dados
  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');
  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'cpf': cpf,
    };
  }
}
