import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etecfood/helpers/firebase_base_helper.dart';
import 'package:etecfood/models/base_model.dart';
import 'package:etecfood/screen/base/base_cubit.dart';

class BaseController {
  BaseController(
      {required this.helper,
      required this.baseCubit,
      });

  final FirebaseBaseHelper helper;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final BaseCubit baseCubit;
  List<BaseModel>? baseList;

  //Carregar todos os produtos
  Future loadAllProduct() async
  {
  baseList = await helper.loadSections();
  baseCubit.setBaseModel(baseList);
  return baseList;
  }
}
