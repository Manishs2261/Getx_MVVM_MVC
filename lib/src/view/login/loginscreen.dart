import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/src/models/login_model/loginmodel.dart';
import 'package:getx_mvvm/src/res/components/roundButton.dart';
import 'package:getx_mvvm/src/utils/utils/utils.dart';
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
                TextFormField(
                  controller: loginController.emailController.value,
                  focusNode: loginController.emailFocusNode.value,
                  validator: (value){
                    if(value!.isEmpty)
                      {
                        Utils.snackBar("email", "Enter email");
                      }
                  },
                  onFieldSubmitted: (value){
                    Utils.fieldFocusChange(context, loginController.emailFocusNode.value, loginController.passwordFocusNode.value);
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder()
                  ),

                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: loginController.passwordController.value,
                  focusNode: loginController.passwordFocusNode.value,
                  obscureText: true,
                  obscuringCharacter: '*',
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      Utils.snackBar("Password", "Enter Password");
                    }
                  },
                  onFieldSubmitted: (value){

                  },
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder()
                  ),

                ),
              ],
            ),
          ),


          SizedBox(height: 40,),
          Obx(() =>  RoundButton(titlel: "Login",
            loading: loginController.loading.value,
            onPress: (){
              if(_formKey.currentState!.validate()){
                loginController.loginApi();
              }

            },widht: 100,height: 40,))
        ],
      ),
    );
  }
}
