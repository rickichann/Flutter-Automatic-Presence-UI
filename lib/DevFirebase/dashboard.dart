import 'package:appgeodetect/DevFirebase/services/crud.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  
  String presence;
  String date;
  String time;

  crudMethods crudObj = new crudMethods();
  
  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Data', style: TextStyle(fontSize: 15.0)),
            content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'presence'),
                onChanged: (value) {
                  this.presence = value;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'date'),
                onChanged: (value) {
                  this.date = value;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'time'),
                onChanged: (value) {
                  this.time = value;
                },
              )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('add'),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop;
              Map<String,dynamic>usersData = {'presence' : this.presence, 'date' : this.date , 'time' : this.time};
              crudObj.addData(usersData).then((result) {
                dialogTrigger(context);
              }).catchError((e) {
                print(e);
              });
            },
          )
        ],
        );
      }
    );
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder : (BuildContext context) {
        return AlertDialog(
          title:Text('Job Done',style:TextStyle(fontSize: 15.0)),
          content: Text('Added'),
          actions: <Widget>[
            FlatButton(
              child: Text('Alright'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },

            )
          ],
        );
      }
    );
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              addDialog(context);
            },
          )
        ],
      ),
      body: Center(),
    );
  }
}