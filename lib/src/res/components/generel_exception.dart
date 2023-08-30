import 'package:flutter/material.dart';
import 'package:getx_mvvm/src/res/colors/colors.dart';

class GeneralException extends StatefulWidget {
  final VoidCallback onPress;
  GeneralException({super.key,required this.onPress});

  @override
  State<GeneralException> createState() => _GeneralExceptionState();
}

class _GeneralExceptionState extends State<GeneralException> {
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
            Text("We are unable to Processing \n Please retry again"),
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
