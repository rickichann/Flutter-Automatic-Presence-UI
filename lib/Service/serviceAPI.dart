import 'dart:convert';

import 'package:appgeodetect/Model/modelAbsen.dart';
import 'package:appgeodetect/Model/modelUsers.dart';
import 'package:appgeodetect/main.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  String baseUrl = "http://10.20.30.131:3000/api"; 
  // String baseUrl2 = "http://10.20.30.131:3000/api";
  
   Future<ModelData> getPostList() async {
    try {
      ModelData data = new ModelData();
      Response response = await http.get('${baseUrl}/users');
      data = new ModelData.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return data;
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  //

   Future<bool> postAbsen(String username, String date, String time) async {
    try {
      String token = await getToken();
      Map header = {
        'Content-Type': 'application/json',
        'auth-token' : '$token'
      } as Map;
      var map = json.encode({
        'username': '$username', 
        'date': '$date', 
        'time' : '$time'
      });
      Response response = await http.post('$baseUrl/posts',
          headers: header, body: map);
      print(response.statusCode);
      print(username);
      // print(token);
      return response.statusCode == 200;
    } catch (ex) {
      print(ex);      
    }
    return null;
  }


  Future<bool> login(String username,String password) async {
    SharedPreferences shared = await SharedPreferences.getInstance();  

    try {
      Map header = {
        'Content-Type': 'application/json',        
      } as Map;      
      var body = json.encode({'username': '$username', 'password':'$password'});
      Response response = await http.post('${baseUrl}/user/login',
        headers: header, body: body
      );
      if (response.statusCode == 200) {
      shared.setString("token", response.body);
      shared.setString("username", username);
      }
      print(response.statusCode);
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }    
    return null;
  }

  Future<String> getToken()async{
     SharedPreferences shared = await SharedPreferences.getInstance();
       return shared.getString("token");
  }
  
 Future<String> getUsername() async{
    SharedPreferences shared = await SharedPreferences.getInstance();
      return shared.getString("username");
 } 

 Future<String> getTime() async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  return shared.getString("time");
 }

 Future<bool> logout() async{
    SharedPreferences shared = await SharedPreferences.getInstance();
      return shared.clear();
 } 

   Future<ModelAbsence> getDataAbsence() async {
    try {
      ModelAbsence dataAbsence = new ModelAbsence();
      Response response = await http.get('${baseUrl}/absence');
      dataAbsence = new ModelAbsence.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return dataAbsence;
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }
}
