import 'package:etecfood/App/UI/Pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  //Injeções de dependencia.
  @override
  List<Bind> get binds => [];

  //Rotas
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage()),
      ];
}
