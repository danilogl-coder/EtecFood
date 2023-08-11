import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Safe Area e Container
      body: Container(
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
          //Card
            Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //Texto
                  const Align(
                  alignment: Alignment.centerLeft,
                     child:  Text("Entrar",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, ),),
                   ),
                   //Espaçamento
                    const SizedBox(
                  height: 10.0,
                ),
                  //Digite seu E-mail
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Digite seu E-mail",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(color: Colors.black))),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  //Espaçamento
                   const SizedBox(
                  height: 15.0,
                ),
                //Digite sua senha
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite sua senha",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                  keyboardType: TextInputType.text,
                ),
                //Espaçamento
                const SizedBox(
                  height: 15.0,
                ),
                //Login
                Row(
                  children: [
                    Expanded( 
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red),
                      onPressed: () {},child: const Text("Entrar")),
                    ),
                  ],
                ),
                //Espaçamento
                const SizedBox(
                  height: 2.0,
                ),
                //Cadastrar-se
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {
                              Modular.to.navigate('/RegisterPage');
                            },
                            child: const Text("Cadastrar-se"))),
                  ],
                ),
                //Esqueci a senha
                   Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: const Text('Esqueci minha senha', style: TextStyle(color: Colors.red),)),
                  ),
                ],
              ),
            )),
          ),
          //Campo de Nome e  E-mail
          
          //Botoes entrar e cadastrar-se
          
        ],
      ),
        ),
      ),
    );
  }
}
