import 'package:get/get.dart';
import 'package:getx_mvvm/src/res/routes/routes_name/routes_name.dart';
import 'package:getx_mvvm/src/view/splash_screen/splashscreen.dart';

class AppRoutes{

  static appRoutes() =>[

    GetPage(name: RoutesName.SplashScreen,
        page: ()=> SplashScreen(),transitionDuration: Duration(milliseconds: 250),transition: Transition.leftToRightWithFade)


  ];

}