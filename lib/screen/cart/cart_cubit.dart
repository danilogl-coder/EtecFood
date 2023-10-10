import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/screen/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: []));
  FirebaseProductHelper helper = FirebaseProductHelper();

  setCart(List<CartModel>? value)
  {
    emit(CartState(items: value));
  }

  
}
