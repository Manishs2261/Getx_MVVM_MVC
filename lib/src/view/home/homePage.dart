import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/src/res/routes/routes_name/routes_name.dart';
import 'package:getx_mvvm/src/view_models/controller/user_prefrence/user_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  UserPreference userPreference = UserPreference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("heme"),
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value) {

              Get.toNamed(RoutesName.loginPage);

            });
          }, icon:Icon(Icons.logout))
        ],
      ),
    );
  }
}
