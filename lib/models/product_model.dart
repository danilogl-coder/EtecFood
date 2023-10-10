import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? name;
  String? description;
  List<String>? images; 

  ProductModel.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document['name'] as String;
    description = document['description'] as String;
    images = List<String>.from(document.get('images') as List<dynamic>);


  }
  

  @override
  String toString() {
    // TODO: implement toString
    return "produto: $id $name $description";

  }

}
