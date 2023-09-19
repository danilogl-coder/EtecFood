import 'package:etecfood/app_store.dart';
import 'package:etecfood/helpers/firebase_register_helper.dart';
import 'package:etecfood/screen/register/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../helpers/firebase_errors.dart';
import '../../models/user_model.dart';

class RegisterController {
  RegisterController(
      {required this.registerCubit, required this.registerHelper});

  final FirebaseRegisterHelper registerHelper;
  final RegisterCubit registerCubit;
  UserModel? userModel;

  registrar(
      {required UserModel user,
      required Function onFail,
      required Function onSuccess}) async {
    try {
      await registerHelper.signUp(email: user.email, senha: user.password);
      user.id = autenticado!.id;
      userModel = user;
      await userModel!.saveData();
      if (userModel!.photograph != null) {
        await uploadPhoto(userModel!);
      }

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  uploadPhoto(UserModel userModel) async {
    await registerHelper.uploadImage(userModel);
  }
}
