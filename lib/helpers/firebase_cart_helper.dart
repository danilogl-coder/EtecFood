import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/models/user_model.dart';

class FirebaseCartHelper 
{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference? cartReference;

  getCartReference(UserModel user)
  {
  DocumentReference ref = FirebaseFirestore.instance.doc('users/${user.id}');
  cartReference = ref.collection('cart');
  print(user.id);
  print(cartReference);
  }
}