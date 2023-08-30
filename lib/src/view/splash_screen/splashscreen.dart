

import 'package:flutter/material.dart';
import 'package:getx_mvvm/src/res/assets/images/images_assetes.dart';
import 'package:getx_mvvm/src/res/components/internet_exception.dart';

import '../../view_models/services/splash_services/services.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices  splashServices =  SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.isLOfin();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body:  Center(child: Text("Welcome",style: TextStyle(fontSize: 25),),)
    );
  }
}
