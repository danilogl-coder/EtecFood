import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Configurações de cores
      backgroundColor: const Color.fromRGBO(37, 39, 62, 1.0),
      //Safe Area e Container
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Logo do aplicativo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 300,
                    child: Image.asset(
                      'assets/image/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              //Texto Entrar
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Entrar",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  )
                ],
              ),
              //Campo de E-mail e Cpf
              Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    //Campo de E-mail
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Digite seu e-mail",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: const BorderSide(
                                color: Colors.red,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: const BorderSide(color: Colors.red))),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //Campo de CPF
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Digite seu CPF",
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(color: Colors.red)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              //Botoes entrar e cadastrar-se
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text("Entrar"))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text("Cadastrar-se"))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
