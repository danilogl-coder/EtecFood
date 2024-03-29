import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';
import 'package:etecfood/screen/cart/components/price_card_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartController {
  //Construtor
  CartController({
    required this.helper,
    required this.cartCubit,
    required this.priceCardCubit,
  });

  final FirebaseCartHelper helper;
  final CartCubit cartCubit;
  final PriceCardCubit priceCardCubit;

  //Adicionar Itens ao Carrinho
  addCartItem(CartModel product) {
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

  removeToCart(CartModel product) async {
    if (product.quantity == 0 || product.quantity < 0) {
      Modular.to.popAndPushNamed('/CartModule/');
      return await helper.removeToCart(product);
    }
  }

  Future countPrice() async {
    double totalPrice = 0.0;
    double? unitPrice;
    List<CartModel> cart = await helper.loadCartItems();
    CartModel product;

    await Future.forEach(cart, (e) async {
      product = e;
      var doc = await helper.getProduct(e.productID);
      unitPrice = doc['price'] ?? 0.0;
      unitPrice = (doc['price'] ?? 0.0) * product.quantity;
      totalPrice = totalPrice + unitPrice!;
    });
    return totalPrice;
  }
}
