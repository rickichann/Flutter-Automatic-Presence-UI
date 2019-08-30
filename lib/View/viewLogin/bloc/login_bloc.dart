import 'dart:async';
import 'package:appgeodetect/Model/modelUsers.dart';
import 'package:appgeodetect/Service/serviceAPI.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      try {
        yield Loading();
        var result = await ApiService().login(event.username,event.password); // Call API
        
        if (result) {
          yield LoginSucces();
        } else {
          yield LoginFailed();
        }
      } catch(e){
        yield LoginFailed();
      }
    }
  }
}
