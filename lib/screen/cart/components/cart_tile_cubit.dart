import 'package:etecfood/screen/cart/components/cart_tile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartTileCubit extends Cubit<CartTileState> {
  CartTileCubit(int quantity) : super(CartTileState(quantity: quantity));

  setQuantity(int value) {
    emit(CartTileState(quantity: value));
  }
}
