
import 'package:etecfood/screen/register/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../helpers/firebase_errors.dart';
import '../../helpers/firebase_login_helper.dart';
import '../../models/user_model.dart';

class RegisterController {
  RegisterController({required this.helper, required this.registerCubit});

  final FirebaseLoginHelper helper;
  final RegisterCubit registerCubit;

  registrar(
      {
      required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    try {
     
      await helper.signUp(email: user.email, senha: user.password);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    
  }
}
