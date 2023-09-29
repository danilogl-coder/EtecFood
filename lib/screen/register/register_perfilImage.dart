// ignore_for_file: file_names

import 'dart:io';
import 'package:etecfood/screen/register/register_perfilImageCubit.dart';
import 'package:etecfood/screen/register/register_perfilImageState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RegisterPerfilImage extends StatelessWidget {
  final Function(File file) onSave;
  final String? imagePath;
  RegisterPerfilImage({super.key, required this.onSave, this.imagePath});

  final _imagePicker = ImagePicker();
  late RegisterPerfilImageCubit bloc;

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      var file = File(pickedFile.path);
      // ignore: use_build_context_synchronously
      bloc.setPerfilImage(file);
      onSave(file);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    bloc =  RegisterPerfilImageCubit(RegisterPerfilImageState());
    bloc.setPerfilImage(imagePath == null ? null : File(imagePath!));
    
    return BlocBuilder<RegisterPerfilImageCubit, RegisterPerfilImageState>(
      bloc: bloc,
        builder: (context, state) {
          return Column(
          
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: state.file != null ? FileImage(state.file!) : null,
              child: state.file != null
                  ? null
                  : const Icon(
                      Icons.person,
                      size: 60,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Camera
        
                  IconButton(
                      onPressed: () {
                        _pickImage(ImageSource.camera, context);
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 40.0,
                      )),
                  const SizedBox(
                    width: 30.0,
                  ),
                  IconButton(
                      onPressed: () {
                        _pickImage(ImageSource.gallery, context);
                      },
                      icon: const Icon(Icons.image, size: 40.0)),
                ],
              ),
            )
          ],
        );
        },
      
    );
  }
}
