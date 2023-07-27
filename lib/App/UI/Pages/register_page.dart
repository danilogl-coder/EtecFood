import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Configurações de cores
      backgroundColor: const Color.fromRGBO(37, 39, 62, 1.0),
      //AppBar e configuração de cor da Appbar
      appBar: AppBar(
        title: const Text("Cadastrar-se"),
        backgroundColor: const Color.fromARGB(255, 17, 17, 37),
      ),
      //Safe Area e Container
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              //Formulario
              Form(
            child: Column(
              children: [
                //Campo de Nome, E-mail, Senha, Cpf, Número, Foto
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      //Campo de Nome
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Digite seu Nome",
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //Campo de E-mail
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Digite seu E-mail",
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
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //Campo de Senha
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Digite sua Senha",
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
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //Campo Confirmar senha
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Repita sua senha",
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
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //Campo Telefone
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Digite seu Número de telefone",
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
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //Campo Cpf
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
                      const SizedBox(
                        height: 15.0,
                      ),
                      //Enviar FOTO - COMEÇO

                      //Enviar FOTO - FIM
                    ],
                  ),
                ),
                //Botão Enviar
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 40.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: const Text(
                              "Enviar",
                              style: TextStyle(fontSize: 22.0),
                            )),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
