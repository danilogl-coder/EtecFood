import 'package:etecfood/models/base_model.dart';
import 'package:etecfood/screen/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseCubit extends Cubit<BaseState>
{
  BaseCubit() : super(BaseState(baseModel: [], carregando: false));

  setBaseModel(List<BaseModel>? value)
  {
    emit(BaseState(baseModel: value, carregando: false));
    
  }

  setCarregando()
  {
    emit(BaseState(carregando: true, baseModel: state.baseModel));
  }

}