import 'package:final_app/assets/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBarModal({String? text,String? subText,color, icon}){
  Get.snackbar(text!, subText!,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(seconds:1),
      isDismissible: true,
      dismissDirection: DismissDirection.endToStart,
      forwardAnimationCurve:Curves.fastLinearToSlowEaseIn ,
      reverseAnimationCurve: Curves.easeInSine,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      borderRadius: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      icon: Icon(icon!,color: Colors.white,size: 35,)
  );
}