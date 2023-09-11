import "package:etecfood/helpers/firebase_login_helper.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart"; //<- importei o flutter modular

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    Modular.get<FirebaseLoginHelper>().checkCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "EtecFood",
      //Tema do aplicativo
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(36, 38, 62, 1.0)),
        drawerTheme: const DrawerThemeData(
            backgroundColor: Color.fromRGBO(37, 39, 62, 1.0)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 17, 17, 37),
        textTheme:
            const TextTheme(displayLarge: TextStyle(color: Colors.white)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routeInformationParser: Modular
          .routeInformationParser, //passei o paramtetro padrão disponível da biblioteca flutter_modular
      routerDelegate: Modular
          .routerDelegate, //passei o paramtetro padrão disponível da biblioteca flutter_modular
    );
  }
}
