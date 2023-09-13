// ignore_for_file: file_names

import 'dart:io';
import 'package:etecfood/screen/register/register_perfilImageState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPerfilImageCubit extends Cubit<RegisterPerfilImageState> {
  RegisterPerfilImageCubit(RegisterPerfilImageState initialState)
      : super(initialState);

  void setPerfilImage(File file) {
    emit(RegisterPerfilImageState(file: file));
  }
}
