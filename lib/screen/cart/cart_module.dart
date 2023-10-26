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
    i.addLazySingleton<FirebaseCartHelper>(FirebaseCartHelper.new);
    i.addLazySingleton<CartCubit>(CartCubit.new);
    i.addLazySingleton<PriceCardCubit>(PriceCardCubit.new);
    i.addInstance<CartController>(CartController(
        helper: i(), cartCubit: i(), priceCardCubit: PriceCardCubit(0.0)));
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => BlocProvider(
              create: (context) => PriceCardCubit(0.0),
              child: BlocProvider(
                  create: (context) => Modular.get<CartCubit>(),
                  child: const CartPage()),
            ));
  }
}
