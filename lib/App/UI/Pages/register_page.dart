import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Declarando chave global do formulario
  final _keyRegisterForm = GlobalKey<FormState>();
  //Controlador
  TextEditingController _controllerCpf = TextEditingController();
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
            key: _keyRegisterForm,
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
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Por favor digite seu nome";
                          }
                          return null;
                        },
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
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Por favor digite seu E-mail";
                          }
                          if (!text.contains("@")) {
                            return "Por digite um e-mail valido com @";
                          }
                          return null;
                        },
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
                        obscureText: true,
                        obscuringCharacter: "*",
                        keyboardType: TextInputType.text,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Por favor digite uma senha";
                          }
                          return null;
                        },
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
                        obscureText: true,
                        obscuringCharacter: "*",
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Por favor repita sua senha";
                          }
                          return null;
                        },
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
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Por favor digite o número de telefone";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //Campo Cpf
                      TextFormField(
                        controller: _controllerCpf,
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
                        maxLength: 14,
                        keyboardType: TextInputType.number,
                        //Formatação do Cpf -- Inicio

                        //Formatação do CPf -- Fim
                        //Validador
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Por favor digite seu CPF";
                          }
                          if (text.length != 11) {
                            return "CPF Invalido";
                          }
                          return null;
                        },
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
                            onPressed: () {
                              if (_keyRegisterForm.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
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
