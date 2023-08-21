import 'package:etecfood/helpers/firebase_login_helper.dart';
import 'package:etecfood/screen/login/login_controller.dart';
import 'package:etecfood/screen/login/login_cubit.dart';
import 'package:etecfood/screen/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<FirebaseLoginHelper>(FirebaseLoginHelper.new);
    i.addLazySingleton<LoginCubit>(LoginCubit.new);
    i.addLazySingleton<LoginController>(LoginController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: ((context) => LoginPage()));
  }
}
