import 'package:etecfood/helpers/firebase_product_helper.dart';

import 'package:etecfood/screen/products/product/product_module.dart';

import 'package:etecfood/screen/products/products_cubit.dart';
import 'package:etecfood/screen/products/products_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductsModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<FirebaseProductHelper>(FirebaseProductHelper.new);
    i.addLazySingleton<ProductCubit>(ProductCubit.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: ((context) => BlocProvider(
              create: (_) => ProductCubit(),
              child: ProductsPage(),
            )));
    r.module("/ProductModule", module: ProductModule());
  }
}
