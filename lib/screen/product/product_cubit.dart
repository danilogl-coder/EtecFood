import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/models/product_model.dart';
import 'package:etecfood/screen/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(products: [], search: ''));
  FirebaseProductHelper helper = FirebaseProductHelper();

  setSearch(dynamic value) {
    emit(ProductState(search: value, products: state.products));
  }

  List<ProductModel> filteredProducts() {
    final List<ProductModel> filteredProduct = [];
    if (state.search == null) {
      filteredProduct.addAll(helper.allProducts);
    } else {
      filteredProduct.addAll(helper.allProducts.where(
          (p) => p.name!.toLowerCase().contains(state.search!.toLowerCase())));
    }
    return filteredProduct;
  }

  Future<void> loadAllProducts() async {
    final products = await helper.loadAllProducts();
    emit(ProductState(products: products));
  }
}
