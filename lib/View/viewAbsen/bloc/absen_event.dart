import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AbsenEvent extends Equatable {
  AbsenEvent([List props = const <dynamic>[]]) : super(props);
}

class Absen extends AbsenEvent {}