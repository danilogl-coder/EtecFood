import 'package:etecfood/models/base_model.dart';

class BaseState 
{
 BaseState({this.baseModel, required this.carregando});
 List<BaseModel>? baseModel;
 final bool carregando;
}