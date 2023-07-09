import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(21, 22, 36, 5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // <- Filho da Coluna
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // <- filho da linha
                Container(
                  // <- Logo
                  padding: EdgeInsets.only(top: 5.0),
                  height: 300.0,
                  width: 300.0,
                  child: Image.asset(
                    'assets/image/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
                // <- Texto (Entrar)
                padding: EdgeInsets.only(right: 300.0),
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 19.0),
                )),
            Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 400.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Digite seu nome",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: 400.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Digite seu CPF",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.red))),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {},
                            child: Text(
                              'Entrar',
                              style: TextStyle(fontSize: 20.0),
                            ))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.red))),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {},
                            child: Text(
                              'Castradar-se',
                              style: TextStyle(fontSize: 20.0),
                            ))),
                  ],
                )
              ],
            ))
          ],
        ));
  }
}
