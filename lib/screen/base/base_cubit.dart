import 'package:etecfood/models/base_model.dart';
import 'package:etecfood/screen/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseCubit extends Cubit<BaseState>
{
  BaseCubit() : super(BaseState(baseModel: []));

  setBaseModel(List<BaseModel>? value)
  {
    emit(BaseState(baseModel: value));
  }

  updateBase()
  {
    emit(BaseState(baseModel: state.baseModel));
  }
}