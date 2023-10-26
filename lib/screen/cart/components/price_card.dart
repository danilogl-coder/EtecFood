
import 'package:etecfood/screen/cart/components/price_card_cubit.dart';
import 'package:etecfood/screen/cart/components/price_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PriceCard extends StatelessWidget {
  const PriceCard({super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    

    return  Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Resumo do Pedido', textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),),
         const SizedBox(height: 12),
           
          const Divider(),
          const SizedBox(height: 12.0,),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total', style: TextStyle(fontWeight: FontWeight.w600),),
              BlocBuilder<PriceCardCubit,PriceCardState>(
               builder: (context, state) =>  Text('R\$ ${state.total}', style: TextStyle(color: Colors.black, fontSize: 16.0),))
            ],
          ),
          const SizedBox(height: 8.0,),
         ElevatedButton(
          onPressed: onPressed, style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 65, 69, 110),)), child:  Text(buttonText, style: const TextStyle(color: Colors.white),)) 
        ],
      ) ,),
    );
  }
}