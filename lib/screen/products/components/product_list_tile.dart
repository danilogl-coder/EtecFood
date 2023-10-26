import 'package:etecfood/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    print(product);
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/ProductsModule/ProductPage', arguments: product);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(product.images!.first),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text('A partir de',
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 12)),
                  ),
                  Text('R\$ ${product.price}',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.green[500])),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
