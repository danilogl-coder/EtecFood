import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/screen/cart/cart_controller.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';
import 'package:etecfood/screen/cart/components/price_card_cubit.dart';
import 'package:etecfood/screen/products/products_controller.dart';
import 'package:etecfood/screen/products/products_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module 
{
 
  @override
  void exportedBinds(Injector i) {
    
      i.addLazySingleton<FirebaseCartHelper>(FirebaseCartHelper.new);
    i.addLazySingleton<CartCubit>(CartCubit.new);
    i.addLazySingleton<PriceCardCubit>(PriceCardCubit.new);
    i.addInstance<CartController>(CartController(
        helper: i(), cartCubit: i(), priceCardCubit: PriceCardCubit(0.0)));


    i.addLazySingleton<FirebaseProductHelper>(FirebaseProductHelper.new);
    i.addLazySingleton<ProductCubit>(ProductCubit.new);
    i.addInstance<ProductController>(
        ProductController(helper: i(), productCubit: i(), cartHelper: i()));

 

  
    super.exportedBinds(i);
  }
}