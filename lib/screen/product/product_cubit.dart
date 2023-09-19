import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/screen/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(products: []));
  FirebaseProductHelper helper = FirebaseProductHelper();

  Future<void> loadAllProducts() async {
    final products = await helper.loadAllProducts();
    emit(ProductState(products: products));
  }
}
