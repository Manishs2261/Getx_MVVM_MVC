import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils/utils.dart';
import '../../../view_models/controller/login_controller/logincontroller.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({
    super.key,
    required this.loginController,
  });

  final LoginControlller loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

    );
  }
}