import 'package:etecfood/screen/base/base_screen.dart';
import 'package:etecfood/screen/user/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart'; //<- Importei o flutter_modular

 import '../screen/user/register_page.dart';

class PageManager extends Module {
  //Injeções de dependencia.
  @override
  void binds(i){}

  //Rotas
  @override
  void routes(r)
  {
    r.child('/', child: (context) => LoginPage());
    r.child("/RegisterPage", child: (context) => const RegisterPage());
    r.child("/BaseScreen", child: (context) => const BaseScreen());
  }
}
