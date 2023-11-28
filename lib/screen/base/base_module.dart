
import 'package:etecfood/helpers/firebase_base_helper.dart';
import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/models/auth_guard.dart';
import 'package:etecfood/screen/base/base_controller.dart';
import 'package:etecfood/screen/base/base_cubit.dart';
import 'package:etecfood/screen/base/base_screen.dart';
import 'package:etecfood/screen/products/products_controller.dart';
import 'package:etecfood/screen/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
  
class BaseModule extends Module {
  @override
  void binds(i) {
  i.addSingleton<FirebaseCartHelper>(FirebaseCartHelper.new);
  i.addLazySingleton<FirebaseProductHelper>(FirebaseProductHelper.new);
  i.addLazySingleton<ProductCubit>(ProductCubit.new);
  i.addInstance<ProductController>(
  ProductController(helper: i(), productCubit: i(), cartHelper: i()));

  i.addLazySingleton<FirebaseBaseHelper>(FirebaseBaseHelper.new);
  i.addLazySingleton<BaseCubit>(BaseCubit.new);
  i.addInstance<BaseController>(BaseController(helper: i(), baseCubit: i()));
 
    
  }

  
  @override
  void routes(r) {
    r.child("/", child: (context) => BlocProvider(
      create: (context) => Modular.get<BaseCubit>(),
      child: const BaseScreen()), guards: [AuthGuard()]);
    
    
  }
}
