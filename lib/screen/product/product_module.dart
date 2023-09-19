import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/screen/product/product_cubit.dart';
import 'package:etecfood/screen/product/product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
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
              child: const ProductPage(),
            )));
  }
}
