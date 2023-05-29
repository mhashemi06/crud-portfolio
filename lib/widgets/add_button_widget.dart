import 'package:final_app/assets/constant.dart';
import 'package:final_app/assets/math_utils.dart';
import 'package:final_app/controllers/form_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddButtonWidget extends GetWidget<FormListController>  {
  const AddButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      heroTag: 'hero',
      backgroundColor: kLightBlueColor,
      elevation: 0,
      onPressed: (){
        controller.myFloatingAction();
        Get.toNamed('/form_screen');
      },
      child: Icon(Icons.add_rounded,size: size.width*0.1,),
    );
  }
}
