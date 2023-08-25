import 'package:etecfood/screen/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(RegisterState initialState) : super(initialState);

  void setLoading(bool value) {
    emit(RegisterState(loading: value));
  }
}
