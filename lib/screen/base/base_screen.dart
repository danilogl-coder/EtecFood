import 'package:flutter/material.dart';

import 'drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget 
{
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('base screen'),
        elevation: 0,
      ),
      body: Stack(
        children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
             Color.fromRGBO(37, 39, 62, 1.0),
            Color.fromARGB(255, 108, 108, 180)
            ], 
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
        ),
        CustomScrollView(
          slivers: [
          
          ],
        )
        ],
      ),
      
    );
  }
}