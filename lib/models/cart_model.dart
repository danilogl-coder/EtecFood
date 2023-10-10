import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/models/product_model.dart';

class CartModel 
{
  //Buscando de Produtos
  CartModel.fromProduct(this.productModel)
  {
   productID = productModel!.id;
   quantity = 1;
  }

  //Inserindo no Firestore;
  CartModel.fromDocument(DocumentSnapshot document)
  {
   id = document.id;
   productID = document.get('pid') as String;
   quantity = document.get('quantity') as int;

  //TODO: SALVAR OS DADOS
  }

  String? id;
  String? productID;
  late int? quantity;

  //Instanciando ProductModel;
  ProductModel? productModel; 
}