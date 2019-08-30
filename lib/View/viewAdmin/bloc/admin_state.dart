import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AdminState extends Equatable {
  AdminState([List props = const <dynamic>[]]) : super(props);
}

class InitialAdminState extends AdminState {}
