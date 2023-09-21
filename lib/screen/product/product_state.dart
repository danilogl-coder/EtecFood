import 'package:etecfood/models/product_model.dart';

class ProductState {
  ProductState({this.products, this.search});
  final List<ProductModel>? products;
  final String? search;
  
}
