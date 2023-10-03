import 'package:etecfood/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.name!),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FlutterCarousel(
            options: CarouselOptions(
              height: 270.0,
              showIndicator: true,
              slideIndicator: const CircularSlideIndicator(),
            ),
            items: product.images!.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.white),
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(i));
                },
              );
            }).toList(),
          ),
         Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
         child: Column(
          children: [
            Text(product.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
            const Divider(thickness: 2, color: Colors.black,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text('Por \$R:' ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)
            ],),
            const Row(
              children: [
                Text('Descrição:' ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),)
              ],
            ),
          ],
         ),)
        ],
      ),
    );
  }
}
