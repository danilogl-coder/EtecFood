import 'package:etecfood/models/product_model.dart';
import 'package:etecfood/screen/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            title: Text(product.name!),
          ),
          SliverToBoxAdapter(
            child: FlutterCarousel(
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
          ),

         SliverToBoxAdapter(
           child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
           child: Column(
            children: [
              Text(product.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              const Divider(thickness: 2, color: Colors.black,),
               const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 Text('Por R\$:' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),),
                   Text('19.99' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.green),)
              ],),
              const Row(
                children: [
                  Text('Descrição:' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(product.description! ,style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0), softWrap: true, maxLines: 20,)),
                ],
              ),
              
                
            ],
           ),),
           
         ),
      
          SliverFillRemaining(
            
            child: Column(
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                            height: 44,
                            child: ElevatedButton(
                              onPressed:() async {
                                await Modular.get<ProductController>().addToCart(product);
                                //Modular.get<CartController>().addCartItem(product);
                                Modular.to.pushNamed('/CartModule/');
                               
                                
                              },
                             style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 65, 69, 110)),
                              child: const Text('Adicionar ao carrinho', style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
