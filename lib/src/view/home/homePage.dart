import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/src/data/response/status_code.dart';
import 'package:getx_mvvm/src/res/components/generel_exception.dart';
import 'package:getx_mvvm/src/res/components/internet_exception.dart';
import 'package:getx_mvvm/src/res/routes/routes_name/routes_name.dart';
import 'package:getx_mvvm/src/view_models/controller/home_controller/home_controller.dart';
import 'package:getx_mvvm/src/view_models/controller/user_prefrence/user_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

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
      body: Obx((){

        switch(homeController.rxRequestStates.value)
            {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator(),);

          case Status.ERROR:
              if(homeController.error.value == 'No Internet')
                {
                  return InternetExceptionWidget(onPress: (){
                    homeController.reFreshApi();
                  });
                }else
                  {
                    return GeneralException(onPress: (){
                      homeController.reFreshApi();
                    });
                  }

          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context,index){

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                    ),
                    title: Text(homeController.userList.value.data![index].firstName.toString()),
                  ),
                );

                });

        }
      }),
    );
  }
}
