import 'package:appgeodetect/DevFirebase/LoginPage.dart';
import 'package:appgeodetect/DevFirebase/dashboard.dart';
import 'package:appgeodetect/View/viewAbsen/AbsenScreen.dart';
import 'package:appgeodetect/View/viewLogin/loginScreen.dart';
import 'package:appgeodetect/authentication/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthBloc authBloc;

  @override
  void initState() {
    authBloc = AuthBloc();
    authBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        bloc: authBloc,
        child: BlocBuilder(
          bloc:authBloc,
          builder: (context, state){
            if (state is InitialAuthState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is Authenticated) {
              return AbsenScreen();
            }
            if (state is Unauthenticated){
              return LoginScreen();
            }
          },
        ),
      ),
    );    
  }
}

