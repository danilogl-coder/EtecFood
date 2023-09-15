import 'dart:io';

class DrawerState {
  DrawerState({required this.loading, this.file});

  bool loading;
  File? file;
}
