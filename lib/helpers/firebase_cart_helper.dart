import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/app_store.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/models/user_model.dart';

class FirebaseCartHelper {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Criei uma instancia de UserModel;
  UserModel? user = UserModel();

  //Lista de CartModel chamada items;
  List<CartModel?>? items = [];

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
      return e;
    }
  }

  //Adicionar items ao carrinho
  Future<void> addToCart(CartModel product) async {
    //Estou armazenando o id de produto
    String? id = product.id;
    if (product.id == null) {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('users')
          .doc(autenticado!.id)
          .collection('cart')
          .where("product_id", isEqualTo: product.productID)
          .get();
      if (snapshot.docs.isNotEmpty) {
        id = snapshot.docs.first.id;
        product.quantity += 1;
      }
    }

    await firestore
        .collection('users')
        .doc(autenticado!.id)
        .collection('cart')
        .doc(id)
        .set(product.toCartItemMap());
  }

  Future removeToCart(CartModel cartModel) async {
    return await firestore
        .collection('users')
        .doc(autenticado!.id)
        .collection('cart')
        .doc(cartModel.id)
        .delete();
  }

  //Pegando referencia entre id de produtos
  Future getReferenceBetwenIdAndProductId(CartModel product) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('users')
        .doc(autenticado!.id)
        .collection('cart')
        .where("product_id", isEqualTo: product.productID)
        .get();

    return snapshot;
  }

  //Recuperando produtos pelo id
  Future getProduct(String? id)
  async {
    DocumentSnapshot<Map<String, dynamic>> snapshot;
    snapshot = await firestore.collection('users').doc(autenticado!.id).collection('cart').doc(id).get();
    return snapshot;
  }


}
