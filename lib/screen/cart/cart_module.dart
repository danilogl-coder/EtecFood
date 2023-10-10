import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/screen/cart/cart_controller.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';
import 'package:etecfood/screen/cart/cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<FirebaseCartHelper>(FirebaseCartHelper.new);
    i.addLazySingleton<CartCubit>(CartCubit.new);
    i.addInstance<CartController>(CartController(helper: i(), cartCubit: i()));
   
  }

  @override
  void routes(r) {
   r.child('/', child: (context) =>  BlocProvider(
    create: (context) => Modular.get<CartCubit>(),
    child: CartScreen()));

  }
}