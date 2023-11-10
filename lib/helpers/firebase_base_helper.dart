import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/models/base_model.dart';

class FirebaseBaseHelper 
{
List<BaseModel> baseList = [];
final FirebaseFirestore firestore = FirebaseFirestore.instance;

//Carregar tudo
Future<void> loadSections() async 
{
  firestore.collection('home').snapshots().listen((snapshot) {
  baseList.clear();
  for(final DocumentSnapshot document in snapshot.docs)
  {
    baseList.add(BaseModel.fromDocument(document));
  }
   });
}
}