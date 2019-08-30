import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AbsenState extends Equatable {
  AbsenState([List props = const <dynamic>[]]) : super(props);
}

class InitialAbsenState extends AbsenState {}

class Loading extends AbsenState {}

class AbsenSucces extends AbsenState{
  final String username;
  final String time;

  AbsenSucces(this.username, this.time) : super([username,time]);
}

class AbsenFailed extends AbsenState{
  final String status;
  
  AbsenFailed(this.status) :super([status]);
}

