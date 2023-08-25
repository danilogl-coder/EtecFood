import 'package:etecfood/helpers/validators_cpf.dart';
import 'package:etecfood/helpers/validators_email.dart';
import 'package:etecfood/helpers/validators_phone.dart';
import 'package:flutter/material.dart';

import '../../commom_components/custom_inputdecoration.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  //Declarando chave global do formulario
  final _keyRegisterForm = GlobalKey<FormState>();

  //Controlador
  final TextEditingController _controllerCpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Configurações de cores
      backgroundColor: const Color.fromRGBO(36, 38, 62, 1.0),
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
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                          key: _keyRegisterForm,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              
                                          children: [
                                            //Campo de Nome, E-mail, Senha, Cpf, Número, Foto
                                            Container(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Column(
                                                children: [
                                                  //Campo de Nome
                                                  TextFormField(
                            decoration: CustomInputDecoration
                                    .setCustomInputDecoration(
                                        label: 'Digite seu Nome Completo',
                                        customColor: Colors.black),
                            keyboardType: TextInputType.name,
                            validator: (name) {
                              if (name!.isEmpty) 
                              {
                                return "Campo obrigatório";
                              }
                              else if(name.trim().split(' ').length <= 1)
                              {
                                return 'Preencha seu nome completo';
                              }
                              return null;
                            },
                                                  ),
                                                  const SizedBox(
                            height: 15.0,
                                                  ),
                                                  //Campo de E-mail
                                                  TextFormField(
                            decoration: CustomInputDecoration
                                    .setCustomInputDecoration(
                                        label: 'Digite seu E-mail',
                                        customColor: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              else if (!emailValid(email)) {
                                return "Por favor digite um e-mail valido";
                              }
                              return null;
                            },
                                                  ),
                                                  const SizedBox(
                            height: 15.0,
                                                  ),
                                                  //Campo de Senha
                                                  TextFormField(
                            decoration: CustomInputDecoration
                                    .setCustomInputDecoration(
                                        label: 'Digite sua Senha',
                                        customColor: Colors.black),
                            obscureText: true,
                            obscuringCharacter: "*",
                            keyboardType: TextInputType.text,
                            validator: (pass) {
                              if (pass!.isEmpty) {
                                return "Campo obrigatório";
                              } else if (pass.length < 6)
                              {
                                return 'Senha muito curta';
                              }
                              return null;
                            },
                                                  ),
                                                  const SizedBox(
                            height: 15.0,
                                                  ),
                                                  //Campo Confirmar senha
                                                  TextFormField(
                            decoration: CustomInputDecoration
                                    .setCustomInputDecoration(
                                        label: 'Repita sua senha',
                                        customColor: Colors.black),
                            obscureText: true,
                            obscuringCharacter: "*",
                            validator: (pass) {
                               if (pass!.isEmpty) {
                                return "Campo obrigatório";
                              } else if (pass.length < 6)
                              {
                                return 'Senha muito curta';
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
                            decoration: CustomInputDecoration
                                    .setCustomInputDecoration(
                                        label: 'Digite seu Numero de telefone',
                                        customColor: Colors.black),
                            keyboardType: TextInputType.phone,
                            validator: (phoneNumber) {
                              return validadePhone(phoneNumber!);
                              
                            },
                                                  ),
                                                  const SizedBox(
                            height: 15.0,
                                                  ),
                                                  //Campo Cpf
                                                  TextFormField(
                            controller: _controllerCpf,
                            decoration: CustomInputDecoration
                                    .setCustomInputDecoration(
                                        label: 'Digite seu CPF',
                                        customColor: Colors.black),
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            //Formatação do Cpf -- Inicio
                                        
                            //Formatação do CPf -- Fim
                            //Validador
                            validator: (cpf) {
                             return validateCPF(cpf!);
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
              ),
        ),
      )),
    );
  }
}
