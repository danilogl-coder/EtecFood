import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "EtecFood",
      theme: ThemeData.dark(),
      routeInformationParser: Modular
          .routeInformationParser, //passei o paramtetro padrão disponível da biblioteca flutter_modular
      routerDelegate: Modular
          .routerDelegate, //passei o paramtetro padrão disponível da biblioteca flutter_modular
    );
  }
}
