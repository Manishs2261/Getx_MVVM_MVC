import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/src/models/login_model/loginmodel.dart';
import 'package:getx_mvvm/src/res/components/roundButton.dart';
import 'package:getx_mvvm/src/utils/utils/utils.dart';
import 'package:getx_mvvm/src/view/login/widget/input_email_widget.dart';
import 'package:getx_mvvm/src/view/login/widget/input_password_widget.dart';
import 'package:getx_mvvm/src/view/login/widget/login_button_widget.dart';
import 'package:getx_mvvm/src/view_models/controller/user_prefrence/user_preference.dart';

import '../../view_models/controller/login_controller/logincontroller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  final loginController = Get.put(LoginControlller());
  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    print("rebiot 🔴");
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                InputEmailWidget(loginController: loginController),
                SizedBox(height: 10,),
                InputPasswordWidget(loginController: loginController),
              ],
            ),
          ),


          SizedBox(height: 40,),
          LoginButtonWidget(loginController: loginController, formKey: _formKey)
        ],
      ),
    );
  }
}






