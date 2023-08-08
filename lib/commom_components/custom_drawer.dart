import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: const [
         DrawerTile(iconData: Icons.home, title: 'Inicio', page:'/',),
         
        ],
      ),
    );
  }
}