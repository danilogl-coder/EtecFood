import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/models/base_model.dart';

class FirebaseBaseHelper 
{
List<BaseModel> baseList = [];
final FirebaseFirestore firestore = FirebaseFirestore.instance;

//Carregar tudo
Future loadSections() async 
{
  QuerySnapshot homeRef = await firestore.collection('home').get();
  baseList.clear();
  for(final DocumentSnapshot document in homeRef.docs)
  {
  BaseModel base = BaseModel.fromDocument(document);
  baseList.add(base);
  }
  return baseList;
  
}
}