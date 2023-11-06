import 'package:get/get.dart';
import 'package:getx_mvvm/src/res/routes/routes_name/routes_name.dart';
import 'package:getx_mvvm/src/view/home/homePage.dart';
import 'package:getx_mvvm/src/view/login/loginscreen.dart';
import 'package:getx_mvvm/src/view/splash_screen/splashscreen.dart';

class AppRoutes{

  static appRoutes() =>[

    //=======splash screeen ===========
    GetPage(name: RoutesName.SplashScreen,
        page: ()=> SplashScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),


   //============hoome screen===========
    GetPage(name: RoutesName.homeScreen,
        page: ()=> HomePage(),transitionDuration: Duration(milliseconds: 250),transition: Transition.leftToRightWithFade),

   //==============login screeen ==========


    GetPage(name: RoutesName.loginPage,
        page: ()=> LoginScreen(),transitionDuration: Duration(milliseconds: 250),transition: Transition.leftToRightWithFade),


  ];

}