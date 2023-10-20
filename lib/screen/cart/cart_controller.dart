
import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/models/product_model.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';

class CartController {
  //Construtor
  CartController({required this.helper, required this.cartCubit});

  final FirebaseCartHelper helper;
  final CartCubit cartCubit;

  //Adicionar Itens ao Carrinho
  addCartItem(ProductModel product)
  {
   helper.addToCart(product);
   
  }


  //Carregar todos os Itens do Carrinho
  Future<void> loadAllCart() async {
    cartCubit.setLoading();
    try {
    final itemsCart = await helper.loadCartItems();
    cartCubit.setComplete(itemsCart);
    } catch (e) {
      print(e);
      rethrow;
    } 
    
  }

  
}
