import 'package:flutter/material.dart';
import 'package:getx_mvvm/src/res/colors/colors.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
   InternetExceptionWidget({super.key,required this.onPress});

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.cloud_off,color: AppColors.redColors,size: 50,),
            Text("We are unable to show result .\nPlease check your data \ connection"),
            SizedBox(height: height * .05),

            ElevatedButton(onPressed: widget.onPress,
              child: Text("Retry",),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primeryButtonColors
            ),)
          ],
        ),
      ),
    );
  }
}
