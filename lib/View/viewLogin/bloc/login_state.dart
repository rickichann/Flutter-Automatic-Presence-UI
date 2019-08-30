import 'package:appgeodetect/Model/modelUsers.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super(props);
}
// Step 2: Create State Login or Failed 
class InitialLoginState extends LoginState {}

class LoginSucces extends LoginState {
 
}

class LoginFailed extends LoginState{}

class AlAbsen extends LoginState{}

class Loading extends LoginState{}
