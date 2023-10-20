import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/screen/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: [], loading: false));

  setLoading()
  {
    emit(CartState(items: [], loading: true, ));
  }

  setComplete(List<CartModel> items)
  {
    emit(CartState(items: items, loading: false, ));
  }

  
}
