import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils/utils.dart';
import '../../../view_models/controller/login_controller/logincontroller.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({
    super.key,
    required this.loginController,
  });

  final LoginControlller loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

    );
  }
}