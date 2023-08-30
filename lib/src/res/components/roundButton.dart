import 'package:flutter/material.dart';
import 'package:getx_mvvm/src/res/colors/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key,
  this.buttonColor = AppColors.primeryButtonColors,
  this.textColor = AppColors.primeryTextColors,
  required this.titlel,
  required this.onPress,
  this.widht= 60,
  this.height =50,
  this.loading = false});
  
  final bool loading ;
  final String titlel;
  final double height,widht;
  final VoidCallback onPress;
  final Color textColor,buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
          width: widht,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30)
        ),
          child: loading ?
            Center(child: CircularProgressIndicator(),) :
             Center(child: Text(titlel)),
      ),
    );
  }
}
