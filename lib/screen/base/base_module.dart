
import 'package:etecfood/helpers/firebase_base_helper.dart';
import 'package:etecfood/models/auth_guard.dart';
import 'package:etecfood/screen/base/base_controller.dart';
import 'package:etecfood/screen/base/base_cubit.dart';
import 'package:etecfood/screen/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BaseModule extends Module {
  @override
  void binds(i) {
  i.addLazySingleton<FirebaseBaseHelper>(FirebaseBaseHelper.new);
  i.addLazySingleton<BaseCubit>(BaseCubit.new);
  i.addInstance<BaseController>(BaseController(helper: i(), baseCubit: i()));
 
    
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => FutureBuilder(
      future: Modular.get<BaseController>().loadAllProduct(),
      builder: (context, snapshot) => snapshot.hasData ? BlocProvider(
        create: (context) => BaseCubit(),
        child: const BaseScreen(), ) : const Padding(padding: EdgeInsets.all(12.0), 
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),),),
    ), guards: [AuthGuard()]);
    
    
  }
}
