import 'package:etecfood/screen/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginState initialState) : super(initialState);

  void setLoading(bool value) {
    emit(LoginState(loading: value));
  }
}
