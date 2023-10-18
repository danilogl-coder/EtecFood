import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/app_store.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/models/product_model.dart';
import 'package:etecfood/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseCartHelper {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Criei uma instancia de UserModel;
  UserModel? user = UserModel();

  //Lista de CartModel chamada items;
  List<CartModel?>? items;
 

  //Carrega os Items do Carrinho
  Future loadCartItems() async {
    try {
      //Aqui estou pegando a referencia do carrinho,
      QuerySnapshot snapshotCart = await firestore
          .collection('users')
          .doc(autenticado!.id)
          .collection('cart')
          .get();

      items = snapshotCart.docs.map((e) => CartModel.fromDocument(e)).toList();

      print(items);    
      return items;
    } catch (e) {
    }
  }

  //Adicionar items ao carrinho
  void addToCart(ProductModel product)
   async {
    try {
      items = await loadCartItems();
      final e = items?.firstWhere((p) => p!.stackable(product));
      e!.increment();
      Modular.to.pushNamed("/CartModule/");

    } catch (e){
      final cartModel =  CartModel.fromProduct(product);
      items!.add(cartModel);

        //Aqui estou pegando a referencia do carrinho,
         await firestore
          .collection('users')
          .doc(autenticado!.id)
          .collection('cart')
          .add(cartModel.toCartItemMap()).then((doc) => cartModel.id = doc.id);
          Modular.to.pushNamed("/CartModule/");
           
         
    }
  }
}
