import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart"; //<- importei o flutter modular

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "EtecFood",
      //Tema do aplicativo
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(37, 39, 62, 1.0)),
        drawerTheme: const DrawerThemeData(backgroundColor: Color.fromRGBO(37, 39, 62, 1.0)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 17, 17, 37),
        textTheme: const TextTheme(displayLarge: TextStyle( color: Colors.white)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routeInformationParser: Modular.routeInformationParser, //passei o paramtetro padrão disponível da biblioteca flutter_modular
      routerDelegate: Modular.routerDelegate, //passei o paramtetro padrão disponível da biblioteca flutter_modular
    );
  }
}
