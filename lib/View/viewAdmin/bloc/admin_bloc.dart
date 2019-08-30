import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  @override
  AdminState get initialState => InitialAdminState();

  @override
  Stream<AdminState> mapEventToState(
    AdminEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
