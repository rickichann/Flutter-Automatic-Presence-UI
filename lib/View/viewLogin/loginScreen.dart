import 'package:appgeodetect/View/viewAbsen/AbsenScreen.dart';
import 'package:appgeodetect/main.dart';
import 'package:flutter/material.dart';
import 'package:appgeodetect/View/viewLogin/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFFf5851f)
        // ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: BlocListener(
            bloc: _loginBloc,
            listener: (context, state) {
              if (state is Loading) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child:CircularProgressIndicator()
                      );                  
                    },
                    // barrierDismissible: false            
                    );
              }
              if (state is LoginSucces) {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
              }
              if (state is LoginFailed) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Failed'),
                        content: Text("Login Failed"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    });
              }            
            },
            
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF039BE5),
                          Color(0xFF039BE5),
                          
                          
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90)
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      
                        Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.memory
                          ,size:150,
                          color: Colors.white,
                          ),
                        ),
                       
                       Align(
                         alignment: Alignment.center,
                         child:Padding(
                           padding: EdgeInsets.only(
                             top:5
                           ),
                           child: Text('EDUSEN',
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                             fontWeight: FontWeight.bold
                           ),),
                         )
                       )
                        // Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //       bottom:32,
                        //       right:32
                        //     ),
                        //     child: Text('Viii',
                        //       style:TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 18
                        //       )
                        //     ),
                        //   )
                        // )

                      ],
                    )


                  // new Image.asset("img/edusen.png",width:200.0), 
                  // new Image.asset("../img/download.png",wi   dth:200.0),
                  // TextField(
                  //   decoration: InputDecoration(hintText: 'NISN'),
                  //   controller: _usernameController,
                  // ),

                  // TextField(
                  //   decoration: InputDecoration(hintText: 'Password'),
                  //   controller: _passwordController,
                  //   obscureText: true,
                  // ),
                  // RaisedButton(
                  //   child: Text('Log in'),
                  //   onPressed: () {
                  //     _loginBloc.dispatch(Login(_usernameController.text, _passwordController.text));
                  //   },
                  // )
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top:62),
                    child:Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: 50,
                          padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50)
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5 
                              )
                            ]
                          ),
                          child: TextField(
                            
                            decoration: InputDecoration(
                              icon: Icon(Icons.input,
                              color:Colors.grey),
                              hintText: 'NISN',
                            ),
                            controller: _usernameController,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: 50,
                          margin: EdgeInsets.only(top : 32),
                          padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50)
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5 
                              )
                            ]
                          ),
                          child: TextField(
                            
                            decoration: InputDecoration(
                              icon: Icon(Icons.vpn_key,
                              color:Colors.grey),
                              hintText: 'Password',
                            ),
                            controller: _passwordController,
                            obscureText: true,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 16, right: 32),
                            child: Text('Forgot Password ?',
                            style: TextStyle(
                              color: Colors.grey
                            ),),
                          ),
                        ),
                        Spacer(),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/1.2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors:[
                                    Color(0xFFf45d27),
                                    Color(0xFFf5851f)
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                               Radius.circular(50) 
                              )                              
                            ),
                            child:RaisedButton(
                              color: Color(0xFF039BE5),
                              child: Text('Login'.toUpperCase(),
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                                                         
                            ),
                          ) , 
                          onPressed:(){
                            _loginBloc.dispatch(Login(_usernameController.text,_passwordController.text));
                          } ,
                          )
                        ),
                      ],
                    )
                  )
                ]),
          ),
          ),
    );
  }
}
