import 'package:etecfood/App/UI/Root.dart'; //<- Importei Root(Roteamento de Páginas)
import 'package:etecfood/App/app_module.dart'; //<- importei o app module.
import 'package:flutter/material.dart'; //<- importei material dart.
import 'package:flutter_modular/flutter_modular.dart'; //<- importei a biblioteca flutter_modular.

void main() {
  //<- Estou rodando RunApp com ModularApp
  runApp(ModularApp(module: AppModule(), child: Root()));
}
