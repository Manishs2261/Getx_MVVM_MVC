import 'package:flutter/cupertino.dart';

class LoginModel {
  String? token;
 bool? isLogin;
  LoginModel({this.token,this.isLogin});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isLogin'] = this.isLogin;
    return data;
  }
}
