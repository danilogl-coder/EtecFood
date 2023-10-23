import 'package:etecfood/commom_components/custom_iconbutton.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/screen/cart/cart_controller.dart';
import 'package:etecfood/screen/cart/components/cart_tile_cubit.dart';
import 'package:etecfood/screen/cart/components/cart_tile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.cartModel});

  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(children: [
          SizedBox(
            height: 80.0,
            width: 80.0,
            child: Image.network(cartModel.productModel?.images?.first ?? ''),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                cartModel.productModel?.name ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 17.0),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Tamanho',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              Text(
                'R\$',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          )),
          BlocBuilder<CartTileCubit, CartTileState>(
            builder: (context, state) => Column(
              children: [
                CustomIconButton(
                    iconData: Icons.add,
                    color: Colors.grey,
                    onTap: () {
                      cartModel.increment();
                      BlocProvider.of<CartTileCubit>(context)
                          .setQuantity(cartModel.quantity);
                      Modular.get<CartController>().addCartItem(cartModel);
                    }),
                Text("${state.quantity}"),
                CustomIconButton(
                    iconData: Icons.remove,
                    color: Colors.grey,
                    onTap: () async {
                      cartModel.decrement();
                      BlocProvider.of<CartTileCubit>(context)
                          .setQuantity(cartModel.quantity);
                      Modular.get<CartController>().addCartItem(cartModel);
                      await Modular.get<CartController>()
                          .removeToCart(cartModel);
                    })
              ],
            ),
          )
        ]),
      ),
    );
  }
}
