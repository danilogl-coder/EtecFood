import 'package:etecfood/helpers/firebase_errors.dart';
import 'package:etecfood/helpers/firebase_login_helper.dart';
import 'package:etecfood/models/user_model.dart';
import 'package:etecfood/screen/login/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  LoginController({required this.helper, required this.loginCubit});

  final FirebaseLoginHelper helper;
  final LoginCubit loginCubit;

  autenticar(
      {required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    try {
     
      await helper.signIn(email: user.email, senha: user.password);
      onSuccess();
   
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }

  }
}
