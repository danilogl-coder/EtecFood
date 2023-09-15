import 'package:etecfood/helpers/firebase_login_helper.dart';
import 'package:etecfood/helpers/validators_email.dart';
import 'package:etecfood/models/user_model.dart';
import 'package:etecfood/screen/login/login_controller.dart';
import 'package:etecfood/screen/login/login_cubit.dart';
import 'package:etecfood/screen/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../commom_components/custom_inputdecoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Modular.get<FirebaseLoginHelper>().checkCurrentUser();
  }

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
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) => Card(
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
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                            //Espaçamento
                            const SizedBox(
                              height: 10.0,
                            ),
                            //Digite seu E-mail
                            TextFormField(
                              enabled: state.loading ? false : true,
                              controller: emailController,
                              decoration: CustomInputDecoration
                                  .setCustomInputDecoration(
                                      label: 'Digite seu E-mail',
                                      customColor: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              validator: (value) {
                                if (!emailValid(value)) {
                                  return 'E-mail invalido';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            //Espaçamento
                            const SizedBox(
                              height: 15.0,
                            ),
                            //Digite sua senha
                            TextFormField(
                              enabled: state.loading ? false : true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  suffixIconColor: Colors.grey,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<LoginCubit>(context)
                                            .setVisibility();
                                      },
                                      child: state.visibility
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off)),
                                  labelText: 'Senha',
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
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
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Senha invalida';
                                } else {
                                  return null;
                                }
                              },
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
                                      onPressed: state.loading
                                          ? null
                                          : () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                BlocProvider.of<LoginCubit>(
                                                        context)
                                                    .setLoading(true);
                                                Modular.get<LoginController>()
                                                    .autenticar(
                                                        user: UserModel(
                                                            email:
                                                                emailController
                                                                    .text,
                                                            password:
                                                                passwordController
                                                                    .text),
                                                        onFail: (e) {
                                                          BlocProvider.of<
                                                                      LoginCubit>(
                                                                  context)
                                                              .setLoading(
                                                                  false);
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                                'Falha ao Entrar: $e'),
                                                            backgroundColor:
                                                                Colors.red,
                                                          ));
                                                        },
                                                        onSuccess: () {
                                                          BlocProvider.of<
                                                                      LoginCubit>(
                                                                  context)
                                                              .setLoading(
                                                                  false);
                                                          debugPrint(
                                                              'sucessos');
                                                          Modular.to
                                                              .pushReplacementNamed('/');
                                                        });
                                              }
                                            },
                                      child: state.loading
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.white),
                                            )
                                          : const Text("Entrar")),
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
                                          Modular.to.pushNamed(
                                              '/RegisterModule/RegisterPage');
                                        },
                                        child: const Text("Cadastrar-se"))),
                              ],
                            ),
                            //Esqueci a senha
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                  onPressed: () {},
                                  child: const Text(
                                    'Esqueci minha senha',
                                    style: TextStyle(color: Colors.red),
                                  )),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
