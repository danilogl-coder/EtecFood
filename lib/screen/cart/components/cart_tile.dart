import 'package:etecfood/models/cart_model.dart';
import 'package:flutter/material.dart';

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
              child: Image.network(cartModel.productModel!.images!.first),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartModel.productModel!.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17.0),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Tamanho',
                        style:  TextStyle(fontWeight: FontWeight.w300),
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
          
              
            
          ]),
        ),
      
    );
  }
}
