import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/screen/cart/cart_controller.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';
import 'package:etecfood/screen/cart/cart_state.dart';
import 'package:etecfood/screen/cart/components/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
  
   
}

class _CartScreenState extends State<CartScreen> {
  List<CartModel>? items;
  @override
  Future<void> initState() async {
    super.initState();
    items = await Modular.get<CartController>().loadCartItems(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit,CartState>(
        builder: (context, state) {
         
          BlocProvider.of<CartCubit>(context).setCart(items);
          return ListView(
          children: [
            Column(
              children: state.items!.map((cartProduct) => CartTile(cartModel: cartProduct,)).toList(),
            ),
           
          ],
        );
        },
      ),
    );
  }
}
