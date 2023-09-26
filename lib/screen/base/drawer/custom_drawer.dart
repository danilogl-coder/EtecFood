import 'package:etecfood/screen/base/drawer/custom_drawer_header.dart';
import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //Estou criando um menu Drawer(Gaveta)
    return Drawer(
      child: ListView(
        children: const [
          CustomDrawerHeader(),
          //Criei um Tile Separado chamado DrawerTile o que me permite instanciar fancilmente dados nele.
          DrawerTile(
            iconData: Icons.home,
            title: 'Inicio',
            page: '/',
          ),
          DrawerTile(
            iconData: Icons.list,
            title: 'Produtos',
            page: '/ProductsModule/',
          ),
          DrawerTile(
            iconData: Icons.playlist_add_check,
            title: 'Meus Pedidos',
            page: '/MeusPedidos',
          ),
          DrawerTile(
            iconData: Icons.location_on,
            title: 'Lojas',
            page: '/Lojas',
          ),
        ],
      ),
    );
  }
}
