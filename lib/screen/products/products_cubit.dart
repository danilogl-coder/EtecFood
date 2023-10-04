import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/screen/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(products: [], search: ''));
  FirebaseProductHelper helper = FirebaseProductHelper();

  setSearch(dynamic value) {
    emit(ProductState(search: value, products: state.products));
  }

  

  Future<void> loadAllProducts() async {
    final products = await helper.loadAllProducts();
    emit(ProductState(products: products));
  }
}
