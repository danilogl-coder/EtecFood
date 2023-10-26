import 'package:etecfood/screen/cart/components/price_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceCardCubit extends Cubit<PriceCardState> {
PriceCardCubit(double total) : super(PriceCardState(total: total));

setPrice(double? value)
{
 emit(PriceCardState(total: value));
}

  
}
