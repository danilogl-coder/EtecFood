import 'package:etecfood/models/base_items.dart';
import 'package:etecfood/screen/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transparent_image/transparent_image.dart';


class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.item});

  final BaseItems item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
      if(item.product != null )
      {
        final product = await Modular.get<ProductController>().findProductById(item.product);
        if(product != null)
        {
        Navigator.of(context).pushNamed('/ProductsModule/ProductPage', arguments: product);
        }
      }
      },
      child: AspectRatio(
                        aspectRatio: 1,
                        child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: item.image!, fit: BoxFit.cover,)),
    );
  }
}