import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/screen/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: []));
  FirebaseCartHelper helper = FirebaseCartHelper();

  Future<void> loadAllCart() async {
    final itemsCart = await helper.loadCartItems();
    emit(CartState(items: await itemsCart));
  }
}
