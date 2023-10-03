import 'dart:io';

import 'package:etecfood/screen/base/drawer/drawer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit(DrawerState initialState) : super(initialState);

  void setLoading(bool value) {
    emit(DrawerState(loading: value,));
  }

  setFile(File? file)
  {
    emit(DrawerState(file: file,));
  }

  

}
