import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/app_store.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/models/user_model.dart';

class FirebaseCartHelper {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Criei uma instancia de UserModel;
  UserModel? user = UserModel();
  //Criei uma lista de CartModels

  //Carrega os Items do Carrinho
  Future loadCartItems() async {
    try {
      //Aqui estou pegando a referencia do carrinho,
      QuerySnapshot snapshotCart = await firestore
          .collection('users')
          .doc(autenticado!.id)
          .collection('cart')
          .get();

      List<CartModel?> items = snapshotCart.docs.map((e) => CartModel.fromDocument(e)).toList();
      //puxando tudo nele e atribuindo na minha lista.;
      
       
          
          
          /*snapshotCart.docs.       
          map((d)  {
            return await d.data()
            /*var doc = await d;
            return CartModel.fromDocument(d);*/
          }).toList();
*/
      print(items);    
      return items;
    } catch (e) {
    }
  }
}
