import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const <dynamic>[]]) : super(props);
}

class AppStarted extends AuthEvent{}

class Logout extends AuthEvent{}
