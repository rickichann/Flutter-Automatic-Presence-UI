import 'package:appgeodetect/Model/modelUsers.dart';
import 'package:appgeodetect/Service/serviceAPI.dart';
import 'package:appgeodetect/View/viewAbsen/bloc/bloc.dart';
import 'package:appgeodetect/authentication/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:analog_time_picker/analog_time_picker.dart';
import 'dart:ui';

import 'package:intl/intl.dart';

class AbsenScreen extends StatefulWidget {  
  @override
  _AbsenScreenState createState() => _AbsenScreenState();
}

class _AbsenScreenState extends State<AbsenScreen> {
  AbsenBloc _absenBloc;
  
  @override
  void initState() {
    _absenBloc = AbsenBloc();
    _absenBloc.dispatch(Absen());
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Absen',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600
        ),),        
        backgroundColor: Colors.white        
      ),
      body: BlocBuilder(
        bloc:_absenBloc,
        builder: (context, state){
          if (state is InitialAbsenState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Loading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AbsenFailed){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state.status == 'isAbsen' ? 'Anda sudah melakukan absen' : 'Tidak ada koneksi internet', style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  )),
                  state.status == 'isAbsen' ? 
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).dispatch(Logout());
                      },
                      child: Text('Logout', style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  ) :
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: (){
                      _absenBloc.dispatch(Absen());
                    },
                  )
                ],
              ),
            );
          }
          if (state is AbsenSucces){
            return Card(
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                new Image.asset("img/kbb.png",width:200.0),     
                  new Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.business,color: Colors.blue,size: 26.0,),
                    title: new Text('SMAN 1 BANDUNG BARAT'
                    ,style: new TextStyle(fontWeight : FontWeight.w400 )),
                    // subtitle: new Text(),
                  ),
                  
                  

                      ],
                    ),
                  ),

                   new ListTile(
                    leading: new Icon(Icons.input,color: Colors.blue,size: 26.0,),
                    title: new Text('NISN'
                    ,style: new TextStyle(fontWeight : FontWeight.w400 )),
                    subtitle: new Text(state.username),
                    
                  ),

                  new ListTile(
                    leading: new Icon(Icons.notifications_active,color:Colors.blue,size: 26.0,),
                    title: new Text('Status'
                    ,style: new TextStyle(fontWeight: FontWeight.w400)),
                    subtitle: new Text('Berhasil'),
                  ),

                  new ListTile(
                    leading: new Icon(Icons.alarm_on,color:Colors.blue,size: 26.0,),
                    title:  new Text('Waktu'
                    ,style: new TextStyle(fontWeight: FontWeight.w400)),
                    subtitle: new Text(state.time)
                  
                  ),
                  

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).dispatch(Logout());
                      },
                      child: Text('Logout', style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  )
                ],
              ),
            );
          }
        },
      )
    );
  }
}
