import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/models/product_model.dart';
import 'package:etecfood/screen/cart/cart_controller.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';
import 'package:etecfood/screen/products/product/product_page.dart';
import 'package:etecfood/screen/products/products_controller.dart';

import 'package:etecfood/screen/products/products_cubit.dart';
import 'package:etecfood/screen/products/products_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductsModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<FirebaseCartHelper>(FirebaseCartHelper.new);
    i.addLazySingleton<FirebaseProductHelper>(FirebaseProductHelper.new);
    i.addLazySingleton<ProductCubit>(ProductCubit.new);
    i.addInstance<ProductController>(
        ProductController(helper: i(), productCubit: i(), cartHelper: i()));

 
    
  }

  @override
  void routes(r) {
    r.child('/',
        child: ((context) => BlocProvider(
              create: (_) => ProductCubit(),
              child: const ProductsPage(),
            )));
    r.child('/ProductPage',
        child: ((context) => BlocProvider(
              create: (_) => ProductCubit(),
              child: ProductPage(product: r.args.data as ProductModel),
            )));
  }
}
