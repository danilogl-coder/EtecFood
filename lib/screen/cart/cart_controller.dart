import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/app_store.dart';
import 'package:etecfood/helpers/firebase_cart_helper.dart';
import 'package:etecfood/models/cart_model.dart';
import 'package:etecfood/models/user_model.dart';
import 'package:etecfood/screen/cart/cart_cubit.dart';

class CartController 
{
  //Construtor
  CartController({required this.helper, required this.cartCubit})
  {
    //Ao iniciar será verificado se o usuario esta logado se sim carregará todos os cart do respectivo.
    updateUserCart();
  }


  final FirebaseCartHelper helper;
  final CartCubit cartCubit;

  //Criei uma lista de CartModels
  List<CartModel>? items = [];
  //Criei uma instancia de UserModel;
  UserModel ? user = UserModel();

  //Atualiza carrinho se o Usuario estiver logado
  void updateUserCart()
  {
    items!.clear();
    if(autenticado != null)
    {
       loadCartItems();
    }
  }

  //Carrega os Items do Carrinho
  Future loadCartItems()
  async {
  try {
  //Aqui estou pegando a referencia do carrinho,
  //puxando tudo nele e atribuindo na minha lista.
  final QuerySnapshot cartSnap = await helper.cartReference!.get();
  return items = cartSnap.docs.map((d) => CartModel.fromDocument(d)).toList();

  }  catch (e) {
    return print(e);
  }
  }


}