import 'package:etecfood/screen/base/base_screen.dart';
import 'package:etecfood/screen/user/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

 import '../screen/user/register_page.dart';

class PageManager extends Module {
  //Injeções de dependencia.
  @override
  List<Bind> get binds => [
    
  ];

  //Rotas
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const BaseScreen()),
        ChildRoute("/RegisterPage", child: (context, args) => const RegisterPage()),
        ChildRoute("/LoginPage", child: ((context, args) => const LoginPage()))

      ];
}
