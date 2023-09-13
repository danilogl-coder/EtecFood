// ignore_for_file: file_names

import 'dart:io';
import 'package:etecfood/screen/register/register_perfilImageCubit.dart';
import 'package:etecfood/screen/register/register_perfilImageState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RegisterPerfilImage extends StatelessWidget {
  RegisterPerfilImage({super.key});

  final _imagePicker = ImagePicker();
  File? file;

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      // ignore: use_build_context_synchronously
      context.read<RegisterPerfilImageCubit>().setPerfilImage(file!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RegisterPerfilImageCubit(RegisterPerfilImageState(file: File(''))),
      child: BlocBuilder<RegisterPerfilImageCubit, RegisterPerfilImageState>(
        builder: (context, state) => Column(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: file != null ? FileImage(state.file) : null,
              child: file != null
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
        ),
      ),
    );
  }
}
