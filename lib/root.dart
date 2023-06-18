import 'package:etecfood/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
