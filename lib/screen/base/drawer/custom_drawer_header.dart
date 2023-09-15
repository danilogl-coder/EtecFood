import "package:etecfood/app_store.dart";
import 'package:etecfood/commom_components/toCapitalize.dart';
import "package:etecfood/helpers/firebase_login_helper.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_note,
                      color: Colors.grey[300],
                      size: 35,
                    ),
                  )
                ],
              )),
          const CircleAvatar(
            radius: 60.0,
            child: Icon(
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
    );
  }
}
