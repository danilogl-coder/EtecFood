import 'package:etecfood/screen/base/base_controller.dart';
import 'package:etecfood/screen/base/base_cubit.dart';
import 'package:etecfood/screen/base/base_state.dart';
import 'package:etecfood/screen/base/components/section_list.dart';
import 'package:etecfood/screen/base/components/section_staggered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget 
{
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<BaseController>().loadAllProduct();
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            onPressed: (){
              Modular.to.pushNamed('/CartModule');
            }, icon: const Icon(Icons.shopping_cart))
        ],
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
          BlocBuilder<BaseCubit, BaseState>(
            builder: (context, state) 

            {
            List<Widget> children = state.carregando ?
            [ const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white
                    ),
                  ),
                )] : 
              state.baseModel!.map((section) {
              
               switch (section.type)
              {
                case 'List':
                return SectionList(section: section,);
                case 'Staggered':
                return SectionStaggered(section: section,);
    
                default:
                return Container();
              }
            }).toList();
              
            
            
            return SliverList(delegate: SliverChildListDelegate(children));
            },)
          ],
        )
        ],
      ),
      
    );
  }
}