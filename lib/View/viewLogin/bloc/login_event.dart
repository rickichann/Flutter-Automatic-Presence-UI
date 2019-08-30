import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

//apa yang ingin anda lakukan ? event

class Login extends LoginEvent{    
  final String username;
  final String password;

  Login(this.username, this.password) : super([username, password]);   
}