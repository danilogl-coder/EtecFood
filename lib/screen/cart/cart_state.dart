import 'package:etecfood/models/cart_model.dart';

class CartState {
  CartState({required this.items, required this.loading});

  List<CartModel>? items; 
  bool loading = false;

  
}
