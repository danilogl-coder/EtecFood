import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/models/base_items.dart';

class BaseModel
{
 String? name;
 String? type;
 List<BaseItems>? items;

 BaseModel.fromDocument(DocumentSnapshot document)
 {
  name = document.get('name') as String;
  type = document.get('type') as String;
  items = (document.get('items') as List).map((e) => 
  BaseItems.fromMap(e as Map<String, dynamic>)).toList();
 }

 @override
 String toString()
 {
  return "BaseModel{name: $name, type: $type, items: $items}";
 }

}