import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/app_store.dart';
import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/models/product_model.dart';
import 'package:etecfood/screen/products/products_cubit.dart';

class ProductController {
  ProductController(
      {required this.helper,
      required this.productCubit,
      required this.cartHelper});

  final FirebaseProductHelper helper;
  final FirebaseCartHelper cartHelper;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final ProductCubit productCubit;

  List<ProductModel> get filteredProducts {
    final List<ProductModel> filteredProduct = [];
    if (productCubit.state.search == null) {
      filteredProduct.addAll(helper.allProducts);
    } else {
      filteredProduct.addAll(helper.allProducts.where((p) => p.name!
          .toLowerCase()
          .contains(productCubit.state.search!.toLowerCase())));
    }
    return filteredProduct;
  }

  void updateSearch(String? search) {
    // Atualize o estado do cubit com a nova pesquisa
    productCubit.setSearch(search);
  }

  Future<void> addToCart(ProductModel product) async {
    var cartModel = CartModel.fromProduct(product);

    QuerySnapshot snapshotCart = await firebaseFirestore
        .collection('users')
        .doc(autenticado!.id)
        .collection('cart')
        .where('product_id', isEqualTo: cartModel.productID)
        .get();

    cartModel.quantity = snapshotCart.docs.first.get('quantity');

    await cartHelper.addToCart(cartModel);
  }
}
