import 'package:etecfood/helpers/firebase_login_helper.dart';
import 'package:etecfood/models/auth_guard.dart';
import 'package:etecfood/screen/base/base_module.dart';
import 'package:etecfood/screen/base/base_screen.dart';
import 'package:etecfood/screen/cart/cart_module.dart';
import 'package:etecfood/screen/login/login_module.dart';
import 'package:etecfood/screen/products/products_module.dart';
import 'package:etecfood/screen/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart'; //<- Importei o flutter_modular

class PageManager extends Module {
  //Injeções de dependencia.
  @override
  void binds(i) {
    i.addLazySingleton<FirebaseLoginHelper>(FirebaseLoginHelper.new);
  }

  //Rotas
  @override
  void routes(r) {
    r.module("/", module: BaseModule());
    r.module('/LoginModule', module: LoginModule());
    r.module("/RegisterModule", module: RegisterModule());
    r.module("/ProductsModule", module: ProductsModule());
    r.module("/CartModule", module: CartModule());
  }
}
