

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods {
  bool isLoggedIn(){
    if (FirebaseAuth.instance.currentUser() !=null ){
      return true;
    }else {
      return false;
    }
  }

  Future<void> addData(usersData) async {
    if (isLoggedIn()){
      Firestore.instance.collection('users').add(usersData).catchError((e){
        print(e);
      });
    }
    else {
      print('You need to be looged in');
    }
  }
}