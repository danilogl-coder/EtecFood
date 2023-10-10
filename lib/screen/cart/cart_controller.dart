import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';

class CartController {
  //Construtor
  CartController({required this.helper, required this.cartCubit});

  final FirebaseCartHelper helper;
  final CartCubit cartCubit;

  CollectionReference? cartReference;

  //Atualiza carrinho se o Usuario estiver logado
}
