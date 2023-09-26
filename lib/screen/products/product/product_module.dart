import 'package:etecfood/models/product_model.dart';
import 'package:etecfood/screen/products/product/product_page.dart';
import 'package:etecfood/screen/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/',
        child: ((context) => BlocProvider(
              create: (_) => ProductCubit(),
              child: ProductPage(product: r.args.data as ProductModel),
            )));
  }
}
