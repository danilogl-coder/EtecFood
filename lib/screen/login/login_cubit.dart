import 'package:etecfood/screen/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(super.initialState);

  setLoading(bool value) {
    emit(LoginState(loading: value));
  }
}
