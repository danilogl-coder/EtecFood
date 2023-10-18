import 'package:etecfood/models/cart_model.dart';

class CartState {
  CartState({required this.items, required this.loading, this.quantity});

  List<CartModel>? items; 
  bool loading = false;
  int? quantity;

  
}
