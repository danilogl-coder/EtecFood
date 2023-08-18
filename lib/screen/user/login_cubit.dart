import 'package:etecfood/screen/user/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(super.initialState);

  setCarregando(bool carregando) => emit(LoginState(carregando: carregando));
}
