import 'package:etecfood/screen/base/base_screen.dart';
import 'package:etecfood/screen/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart'; //<- Importei o flutter_modular

import '../screen/register/register_page.dart';

class PageManager extends Module {
  //Injeções de dependencia.
  @override
  void binds(i) {}

  //Rotas
  @override
  void routes(r) {
    //r.module('/', module: LoginModule());
    r.child("/", child: (context) =>  RegisterPage());
    r.child("/RegisterPage", child: (context) => RegisterPage());
    r.child("/BaseScreen", child: (context) => const BaseScreen());
  }
}
