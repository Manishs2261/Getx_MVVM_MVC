import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../res/components/roundButton.dart';
import '../../../view_models/controller/login_controller/logincontroller.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.loginController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final LoginControlller loginController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  RoundButton(titlel: "Login",
      loading: loginController.loading.value,
      onPress: (){
        if(_formKey.currentState!.validate()){
          loginController.loginApi();
        }

      },widht: 100,height: 40,));
  }
}