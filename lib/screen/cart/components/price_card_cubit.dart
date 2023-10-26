import 'package:etecfood/screen/cart/cart_controller.dart';
import 'package:etecfood/screen/cart/components/price_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PriceCardCubit extends Cubit<PriceCardState> {
  PriceCardCubit(double total) : super(PriceCardState(total: 0.0));

  void updateTotalPrice() async {
    double? totalPrice = 0.0;
    totalPrice = await Modular.get<CartController>().countPrice();
    emit(PriceCardState(total: totalPrice));
  }

  void setState() {
    emit(PriceCardState(total: 0.0));
  }
}
