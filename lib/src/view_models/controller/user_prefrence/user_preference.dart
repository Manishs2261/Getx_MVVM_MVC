import 'package:get/get.dart';
import 'package:getx_mvvm/src/models/login_model/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {


  Future<bool>saveUser(LoginModel loginModel) async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token',  loginModel.token.toString());
    sp.setBool('isLogin', loginModel.isLogin!);
    return true;
  }

  Future<LoginModel>getUser() async{

    SharedPreferences sp = await SharedPreferences.getInstance();
   String? token =  sp.getString('token');
   bool? isLogin = sp.getBool('isLogin');
    return LoginModel(
      token: token,
      isLogin: isLogin
    ) ;
  }

  Future<bool> removeUser()async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();

    return true;
  }
}