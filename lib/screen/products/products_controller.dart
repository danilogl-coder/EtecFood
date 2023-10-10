import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/models/product_model.dart';
import 'package:etecfood/screen/products/products_cubit.dart';


class ProductController {
  ProductController({required this.helper, required this.productCubit});

  final FirebaseProductHelper helper;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final ProductCubit productCubit;

  List<ProductModel> get filteredProducts {
    final List<ProductModel> filteredProduct = [];
    if (productCubit.state.search == null) {
      filteredProduct.addAll(helper.allProducts);
    } else {
      filteredProduct.addAll(helper.allProducts.where(
          (p) => p.name!.toLowerCase().contains(productCubit.state.search!.toLowerCase())));
    }
    return filteredProduct;
  }

   void updateSearch(String? search) {
    // Atualize o estado do cubit com a nova pesquisa
    productCubit.setSearch(search);
  }
}