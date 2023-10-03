import "dart:io";

import "package:etecfood/app_store.dart";
import 'package:etecfood/commom_components/toCapitalize.dart';
import "package:etecfood/helpers/firebase_login_helper.dart";
import "package:etecfood/screen/base/drawer/drawer_cubit.dart";
import "package:etecfood/screen/base/drawer/drawer_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class CustomDrawerHeader extends StatelessWidget {
 CustomDrawerHeader({super.key, this.imagePath});
  late DrawerCubit bloc;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    bloc = DrawerCubit(DrawerState());
    getTemporaryDirectory().then((imageDir) => bloc.setFile(imagePath == null ? null : File('${imageDir.path}/${imagePath!}')));
    return BlocBuilder<DrawerCubit,DrawerState>(
      bloc: bloc,
      builder: (context, state) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          Modular.get<FirebaseLoginHelper>().signOut();
                        },
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                        label: Text(
                          'Sair',
                          style: TextStyle(color: Colors.grey[300]),
                        )),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Modular.to.pushNamed('/RegisterModule/RegisterPage');
                      },
                      icon: Icon(
                        Icons.edit_note,
                        color: Colors.grey[300],
                        size: 35,
                      ),
                    )
                  ],
                )),
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                toCapitalize(autenticado!.name!),
                style: TextStyle(color: Colors.grey[300], fontSize: 20),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
