import 'dart:async';
import 'package:appgeodetect/Service/serviceAPI.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:intl/intl.dart';

class AbsenBloc extends Bloc<AbsenEvent, AbsenState> {
  @override
  AbsenState get initialState => InitialAbsenState();

  @override
  Stream<AbsenState> mapEventToState(
    AbsenEvent event,
  ) async* {
    if (event is Absen) {
      yield Loading();
      try {
        String username = await ApiService().getUsername();
        
        DateTime date = DateTime.now();
        String dateFormat = DateFormat('yyyy-MM-dd').format(date);
        String timeFormate = DateFormat('HH:mm:ss').format(date);
        var result = await ApiService().postAbsen(username, dateFormat, timeFormate);
        String time = timeFormate;
        if (result) {
          yield AbsenSucces(username,time);
          
        } else {
          yield AbsenFailed('isAbsen');
        }
      } catch (e) {
        yield AbsenFailed('noConnection');
      }     
    }
  }
}
