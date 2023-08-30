import 'package:etecfood/app_store.dart';
import 'package:etecfood/screen/register/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../helpers/firebase_errors.dart';
import '../../helpers/firebase_login_helper.dart';
import '../../models/user_model.dart';

class RegisterController {
  RegisterController({required this.helper, required this.registerCubit});

  final FirebaseLoginHelper helper;
  final RegisterCubit registerCubit;
  UserModel? userModel;

  registrar(
      {required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    try {
      await helper.signUp(email: user.email, senha: user.password);
      user.id = autenticado!.id;
      userModel = user;
      await userModel!.saveData();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
  }
}
