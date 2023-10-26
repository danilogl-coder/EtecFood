
import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/screen/cart/cart_controller.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';
import 'package:etecfood/screen/cart/cart_state.dart';
import 'package:etecfood/screen/cart/components/cart_tile.dart';
import 'package:etecfood/screen/cart/components/cart_tile_cubit.dart';
import 'package:etecfood/screen/cart/components/price_card.dart';
import 'package:etecfood/screen/cart/components/price_card_cubit.dart';
import 'package:etecfood/screen/cart/components/price_card_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  const CartPage({super.key});



@override
  Widget build(BuildContext context) {
    Modular.get<CartController>().loadAllCart();
    var helper = FirebaseProductHelper();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.loading ? const Center(
            child: CircularProgressIndicator( 
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ) : 
          ListView(
            children: [
              Column(

                
                children: (state.items ?? [])
                    .map((cartProduct) => FutureBuilder(
                      future: helper.getProduct(cartProduct.productID!),
                      builder: (context, snapshot) => snapshot.hasData ?  BlocProvider(
                        create: (context) => CartTileCubit(cartProduct.quantity),
                        child: CartTile(
                              cartModel: cartProduct ,
                            ),
                      ) : const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                    ))
                    .toList(),
              ),
              BlocProvider(
                create: (context) => PriceCardCubit(0.0),
                child: PriceCard(buttonText: 'Fazer o pedido', onPressed: (){
                Modular.get<CartController>().updatePrice();
                }),
              )
            ],
          );
        },
      ),
    );
  }
}
