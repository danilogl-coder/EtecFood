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
      
    );
  }
}