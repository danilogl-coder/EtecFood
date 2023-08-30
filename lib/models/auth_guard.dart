import 'dart:async';

import 'package:etecfood/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login');
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return autenticado != null;
  }
}
