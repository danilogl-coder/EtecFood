import 'package:etecfood/app_store.dart';
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
        children: [
          CustomDrawerHeader(imagePath: autenticado!.photograph),
          //Criei um Tile Separado chamado DrawerTile o que me permite instanciar fancilmente dados nele.
          const DrawerTile(
            iconData: Icons.home,
            title: 'Inicio',
            page: '/',
          ),
          const DrawerTile(
            iconData: Icons.list,
            title: 'Produtos',
            page: '/ProductsModule/',
          ),
          const DrawerTile(
            iconData: Icons.playlist_add_check,
            title: 'Meus Pedidos',
            page: '/MeusPedidos',
          ),
          const DrawerTile(
            iconData: Icons.location_on,
            title: 'Lojas',
            page: '/Lojas',
          ),
        ],
      ),
    );
  }
}
