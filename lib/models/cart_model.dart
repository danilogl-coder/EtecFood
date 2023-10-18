import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/models/product_model.dart';

class CartModel {
  String? id;
  String? productID;
  late int quantity;

  //Instanciando ProductModel;
  ProductModel? productModel;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Buscando de Produtos
  CartModel.fromProduct(this.productModel) {
    productID = productModel!.id;
    quantity = 1;
  }

  //Inserindo no Firestore;
  CartModel.fromDocument(DocumentSnapshot document) {
    id = document.id;
    productID = document.get('product_id') as String;
    quantity = document.get('quantity') as int;
    firestore.doc('products/$productID').get().then((doc) {
       productModel = ProductModel.fromDocument(doc);
    
    });

  }

  Map<String, dynamic> toCartItemMap()
  {
    return {
      'product_id' : productID,
      'quantity' : quantity,
    };
  }

  //Produto Stackable
  bool stackable(ProductModel product)
  {
    return product.id == productID;
  }

  //Acrescentar item
  void increment()
  {
    quantity++;
  }

  @override
  String toString() {
    return "CartModel: $id, $productID, $quantity";
  }


}
