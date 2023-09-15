import 'package:etecfood/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerController
{
  DrawerController();

  editPerfil() async
  {
   try {
   UserModel? userModel = await Modular.to.pushNamed('/RegisterModule/');
   } catch (e) {
     
   }
  }
}