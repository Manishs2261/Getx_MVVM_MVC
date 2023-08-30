import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/src/Repository/login_repo/login_repo.dart';
import 'package:getx_mvvm/src/models/login_model/loginmodel.dart';
import 'package:getx_mvvm/src/res/routes/routes_name/routes_name.dart';
import 'package:getx_mvvm/src/utils/utils/utils.dart';

import '../user_prefrence/user_preference.dart';

class LoginControlller extends GetxController{

  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi(){
    loading.value = true;
    Map data = {
      "email": emailController.value.text ,
      "password": passwordController.value.text,
    };
    _api.loginAPi(data).then((value) {
      loading.value= false;
      if(value['error'] == 'user not found' || value['error'] == 'Missing email or username' )
        {
          Utils.snackBar('Login', value['error']);
        }else
          {
            LoginModel loginModel = LoginModel(
              token: value['token'],
              isLogin:  true,
            );

            Utils.snackBar("Login", "login successfuly");
            userPreference.saveUser(loginModel).then((value) {
              Get.offNamed(RoutesName.homeScreen);
            }).onError((error, stackTrace) {


            });
          }


    }).onError((error, stackTrace) {
      loading.value= false;
      print(error.toString());
      Utils.snackBar("Error", error.toString());

    });
}

}