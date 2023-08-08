import "package:etecfood/models/page_manager.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, required this.iconData, required this.title, required this.page});

  final IconData iconData;
  final String title;
  final String page;

  @override
  Widget build(BuildContext context) {
    return 
    
    InkWell(
      onTap:  Modular.to.path == page ? null : (){
        Modular.to.navigate(page);
      },
      child: SizedBox(
        height: 60.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Icon(iconData, size: 32,),
            ),
            Text(title, style: const TextStyle(fontSize: 16.0),)
          ],
        ),
      ),
    );
  }
}