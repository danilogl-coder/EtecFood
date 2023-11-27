import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/screen/cart/cart_controller.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';
import 'package:etecfood/screen/cart/cart_page.dart';
import 'package:etecfood/screen/cart/components/price_card_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<FirebaseCartHelper>(FirebaseCartHelper.new);
    i.addSingleton<CartCubit>(CartCubit.new);
    i.addSingleton<PriceCardCubit>(() => PriceCardCubit(0.0));
    i.addInstance<CartController>(CartController(
        helper: i(), cartCubit: i(), priceCardCubit: i()));
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => BlocProvider(
              create: (context) => Modular.get<PriceCardCubit>(),
              child: BlocProvider(
                  create: (context) => Modular.get<CartCubit>(),
                  child: const CartPage()),
            ));
  }
}
