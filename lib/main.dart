
import 'package:etecfood/models/app.dart';  //<- Importei app(MaterialApp)
import 'package:etecfood/models/page_manager.dart'; //<- importei o page_manager(gerenciador de paginas.)
import 'package:flutter/material.dart'; //<- importei material dart.
import 'package:flutter_modular/flutter_modular.dart'; //<- importei a biblioteca flutter_modular.

void main() {
  //<- Estou rodando RunApp com ModularApp
  runApp(ModularApp(module: PageManager(), child: const Root()));
}
