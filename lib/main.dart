
import 'package:etecfood/models/app.dart';  //<- Importei app(MaterialApp)
import 'package:etecfood/models/page_manager.dart'; //<- importei o page_manager(gerenciador de paginas.)
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; //<- importei material dart.
import 'package:flutter_modular/flutter_modular.dart';

import 'firebase_options.dart'; //<- importei a biblioteca flutter_modular.

void main() async {
// Esse comando esta garantindo inicialização correta antes do flutter iniciar
WidgetsFlutterBinding.ensureInitialized();
// Esse comando inicializa o servidor
await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
	 
  //<- Estou rodando RunApp com PageManager(Gerenciador de paginas)
  runApp(ModularApp(module: PageManager(), child: const Root()));
}
