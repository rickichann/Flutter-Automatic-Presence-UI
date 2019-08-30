import 'dart:async';
import 'package:appgeodetect/Service/serviceAPI.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted){
      var isLoggedIn = await ApiService().getToken();
      if (isLoggedIn != null) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }
    if (event is Logout){      
      await ApiService().logout();
      yield Unauthenticated();
    }
  }
}
