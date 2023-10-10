import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/models/product_model.dart';

class FirebaseProductHelper {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseProductHelper() {
    loadAllProducts();
  }

  List<ProductModel> allProducts = [];

  Future loadAllProducts() async {
    final QuerySnapshot snapProducts =
        await firestore.collection('products').get();

    return allProducts =
        snapProducts.docs.map((e) => ProductModel.fromDocument(e)).toList();
  }

  Future<ProductModel> getProduct(String id)
  async {
     final DocumentSnapshot snapProducts = await (firestore.doc('products/$id')).get();
    return ProductModel.fromDocument(snapProducts);
  }
}
