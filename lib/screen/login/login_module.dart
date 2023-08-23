import 'package:etecfood/helpers/firebase_login_helper.dart';
import 'package:etecfood/screen/login/login_controller.dart';
import 'package:etecfood/screen/login/login_cubit.dart';
import 'package:etecfood/screen/login/login_page.dart';
import 'package:etecfood/screen/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<FirebaseLoginHelper>(FirebaseLoginHelper.new);
    i.addLazySingleton<LoginCubit>(LoginCubit.new);
    i.addInstance<LoginController>(LoginController(
        helper: FirebaseLoginHelper(),
        loginCubit: LoginCubit(LoginState(loading: false))));
  }

  @override
  void routes(r) {
    r.child('/',
        child: ((context) => BlocProvider(
              create: (_) => LoginCubit(LoginState(loading: false)),
              child: LoginPage(),
            )));
  }
}
