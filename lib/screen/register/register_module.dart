import 'package:etecfood/helpers/firebase_register_helper.dart';
import 'package:etecfood/screen/register/register_controller.dart';
import 'package:etecfood/screen/register/register_cubit.dart';
import 'package:etecfood/screen/register/register_page.dart';
import 'package:etecfood/screen/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../helpers/firebase_login_helper.dart';

class RegisterModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<FirebaseLoginHelper>(FirebaseLoginHelper.new);
    i.addLazySingleton<RegisterCubit>(RegisterCubit.new);
    i.addInstance<RegisterController>(RegisterController(
        registerHelper: FirebaseRegisterHelper(),
        registerCubit:
            RegisterCubit(RegisterState(loading: false, visibility: true))));
  }

  @override
  void routes(r) {
    r.child("/RegisterPage",
        child: ((context) => BlocProvider(
              create: (_) => RegisterCubit(
                  RegisterState(loading: false, visibility: false)),
              child: RegisterPage(),
            )));
  }
}
