import 'package:etecfood/helpers/validators_cpf.dart';
import 'package:etecfood/helpers/validators_email.dart';
import 'package:etecfood/helpers/validators_phone.dart';
import 'package:etecfood/screen/register/register_controller.dart';
import 'package:etecfood/screen/register/register_cubit.dart';
import 'package:etecfood/screen/register/register_perfilImage.dart';
import 'package:etecfood/screen/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../commom_components/custom_inputdecoration.dart';
import '../../models/user_model.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  //Declarando chave global do formulario
  final _keyRegisterForm = GlobalKey<FormState>();

  final UserModel user = UserModel();

  //Controlador
  final TextEditingController _controllerCpf = TextEditingController();

  bool visibility = false;

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
              BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) => Card(
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
                            //Campo da Foto
                            RegisterPerfilImage(),
                            //Campo de Nome
                            TextFormField(
                              enabled: state.loading ? false : true,
                              decoration: CustomInputDecoration
                                  .setCustomInputDecoration(
                                      label: 'Digite seu Nome Completo',
                                      customColor: Colors.black),
                              keyboardType: TextInputType.name,
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return "Campo obrigatório";
                                } else if (name.trim().split(' ').length <= 1) {
                                  return 'Preencha seu nome completo';
                                }
                                return null;
                              },
                              onSaved: (name) => user.name = name,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            //Campo de E-mail
                            TextFormField(
                              enabled: state.loading ? false : true,
                              decoration: CustomInputDecoration
                                  .setCustomInputDecoration(
                                      label: 'Digite seu E-mail',
                                      customColor: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email!.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (!emailValid(email)) {
                                  return "Por favor digite um e-mail valido";
                                }
                                return null;
                              },
                              onSaved: (email) => user.email = email,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            //Campo de Senha
                            TextFormField(
                              enabled: state.loading ? false : true,
                              decoration: InputDecoration(
                                  suffixIconColor: Colors.black,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<RegisterCubit>(context)
                                            .setVisibility();
                                      },
                                      child: state.visibility
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off)),
                                  labelText: 'Senha',
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black))),
                              obscureText: !state.visibility,
                              obscuringCharacter: "*",
                              keyboardType: TextInputType.text,
                              validator: (pass) {
                                if (pass!.isEmpty) {
                                  return "Campo obrigatório";
                                } else if (pass.length < 6) {
                                  return 'Senha muito curta';
                                }
                                return null;
                              },
                              onSaved: (pass) => user.password = pass,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            //Campo Confirmar senha
                            TextFormField(
                              enabled: state.loading ? false : true,
                              decoration: CustomInputDecoration
                                  .setCustomInputDecoration(
                                      label: 'Repita sua senha',
                                      customColor: Colors.black),
                              obscureText: !state.visibility,
                              obscuringCharacter: "*",
                              validator: (pass) {
                                if (pass!.isEmpty) {
                                  return "Campo obrigatório";
                                } else if (pass.length < 6) {
                                  return 'Senha muito curta';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onSaved: (pass) => user.confirmPassword = pass,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            //Campo Telefone
                            TextFormField(
                              enabled: state.loading ? false : true,
                              decoration: CustomInputDecoration
                                  .setCustomInputDecoration(
                                      label: 'Digite seu Numero de telefone',
                                      customColor: Colors.black),
                              keyboardType: TextInputType.phone,
                              validator: (phoneNumber) {
                                return validadePhone(phoneNumber!);
                              },
                              onSaved: (phone) => user.phoneNumber = phone,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            //Campo Cpf
                            TextFormField(
                              controller: _controllerCpf,
                              enabled: state.loading ? false : true,
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
                              onSaved: (cpf) => user.cpf = cpf,
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
                                    if (_keyRegisterForm.currentState!
                                        .validate()) {
                                      _keyRegisterForm.currentState!.save();
                                      BlocProvider.of<RegisterCubit>(context)
                                          .setLoading(true);
                                      if (user.password !=
                                          user.confirmPassword) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              Text('Senhas não coincidem!'),
                                          backgroundColor: Colors.red,
                                        ));
                                        BlocProvider.of<RegisterCubit>(context)
                                            .setLoading(false);
                                        return;
                                      }
                                      Modular.get<RegisterController>()
                                          .registrar(
                                              user: user,
                                              onFail: (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Falha ao Cadastrar $e'),
                                                  backgroundColor: Colors.red,
                                                ));
                                              },
                                              onSuccess: () {
                                                BlocProvider.of<RegisterCubit>(
                                                        context)
                                                    .setLoading(false);
                                                debugPrint('sucesso');
                                                Modular.to.pop();
                                              });
                                    }
                                  },
                                  child: state.loading
                                      ? const CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        )
                                      : const Text(
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
        ),
      )),
    );
  }
}
