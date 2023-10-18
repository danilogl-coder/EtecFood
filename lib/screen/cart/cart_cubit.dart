import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/screen/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: [], loading: false, quantity: 0));

  setLoading()
  {
    emit(CartState(items: [], loading: true, quantity: state.quantity));
  }

  setComplete(List<CartModel> items)
  {
    emit(CartState(items: items, loading: false, quantity: state.quantity));
  }

  setQuantity(int value)
  {
    emit(CartState(quantity: value,  items: state.items, loading: state.loading));
  }

  
}
