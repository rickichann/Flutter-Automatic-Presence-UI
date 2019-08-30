import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AdminEvent extends Equatable {
  AdminEvent([List props = const <dynamic>[]]) : super(props);
}
