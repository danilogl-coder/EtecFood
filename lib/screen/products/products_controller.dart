import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/helpers/firebase_product_helper.dart';
import 'package:etecfood/screen/products/products_cubit.dart';

class ProductController {
  ProductController({required this.helper, required this.productCubit});

  final FirebaseProductHelper helper;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final ProductCubit productCubit;
}
