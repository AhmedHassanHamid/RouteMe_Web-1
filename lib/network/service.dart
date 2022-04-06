

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:web/network/end_point.dart';
import 'package:web/network/login_response.dart';

class MyService extends ChangeNotifier{
  LoginResponse? login;


  Future userLogin({
    required String? server,
    required String? email,
    required String? password,
    required String endPoint,
  })async {
    var url = Uri.parse(baseURL+endPoint);
    await http.post(url, body: {
      'server': server,
      'email': email,
      'password': password,
    }).then((value){
      print(value.body);
      final data = json.decode(value.body);
      login = LoginResponse.fromJson(data);
      if(login!.status == 200){
        print(login!.user![0].name);
      }else{
        print(login!.message);
      }
    });
  }
}