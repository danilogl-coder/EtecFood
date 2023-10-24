import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? categoryId;
  String? name;
  String? description;
  double? price;
  int? stock;
  String? category;
  List<String>? images; 

  ProductModel.fromDocument(DocumentSnapshot document) {
    id = document.id;
    categoryId = document['category_id'] as String;
    name = document['name'] as String;
    description = document['description'] as String;
    price = document['price'];
    stock = document['stock'];
    category = document['category'] ?? '';
    
    images = List<String>.from(document.get('images') as List<dynamic>);


  }
  

  @override
  String toString() {
    // TODO: implement toString
    return "produto: $id $name $description";

  }

}
