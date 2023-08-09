import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, required this.iconData, required this.title, required this.page});

  final IconData iconData;  //Variavel da instancia icone
  final String title; //Variavel da intancia titulo
  final String page; //Variavel da pagina

  @override
  Widget build(BuildContext context) {
    return 
    
    InkWell(
      //Logica que não me permite clicar no botão caso eu já esteja na mesma pagina.
      //Modular.to.path -> me retorna o caminho atual.
      onTap:  Modular.to.path == page ? null : (){
        Modular.to.navigate(page);
      },
      child: SizedBox(
        height: 60.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Icon(iconData, size: 32, color: Modular.to.path == page ? Colors.red[700] : Colors.white,),
            ),
            Text(title, style:  TextStyle(fontSize: 16.0,color: Modular.to.path == page ? Colors.red[700] : Colors.white),)
          ],
        ),
      ),
    );
  }
}