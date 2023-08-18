import 'package:etecfood/helpers/firebase_user.dart';
import 'package:etecfood/screen/user/login_controller.dart';
import 'package:etecfood/screen/user/login_cubit.dart';
import 'package:etecfood/screen/user/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  void binds(i) {
    i.addLazySingleton<FirebaseUserHelper>(FirebaseUserHelper.new);
    i.addLazySingleton<LoginCubit>(LoginCubit.new);
    i.addLazySingleton<LoginController>(LoginController.new);
  }

  void routes(r) {
    r.child('/', child: ((context) => LoginPage()));
  }
}
