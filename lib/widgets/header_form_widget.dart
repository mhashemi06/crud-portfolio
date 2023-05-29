import 'package:final_app/assets/constant.dart';
import 'package:final_app/assets/math_utils.dart';
import 'package:final_app/controllers/form_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class HeaderFormWidget extends GetWidget<FormListController> {
  const HeaderFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top:size.width*0.06,right: size.width*0.06,left:size.width*0.07,bottom: size.width*0.08 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(controller.isEditing? 'Edit Form':'Customer Form',style: AppStyle.boldFont22Blue,),
          Hero(
              tag: 'hero',
              child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      onPressed: (){Get.back();},
                      icon: const Icon(Icons.close))
              )
          )
        ],
      ),
    );
  }
}
