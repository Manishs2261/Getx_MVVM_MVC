import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_mvvm/src/res/routes/routes_name/routes_name.dart';
import 'package:getx_mvvm/src/view_models/controller/user_prefrence/user_preference.dart';

class SplashServices{


  UserPreference userPreference = UserPreference();

  void isLOfin(){
 userPreference.getUser().then((value) {

   print(value.token);
   if(value.token.toString() == 'null'){

     print("mansi");
   Timer(const Duration(seconds: 3),
           ()=> Get.offNamed(RoutesName.loginPage));


 }else
   {
     Timer(const Duration(seconds: 3),
             ()=> Get.offNamed(RoutesName.homeScreen));
   }

 });

  }
}