import 'package:final_app/assets/constant.dart';
import 'package:final_app/assets/math_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDialogModal extends StatelessWidget {
  final Function()? onPressd;
  const ShowDialogModal ({Key? key,required this.onPressd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    child:AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.only(top: size.width*0.03,right:size.width*0.1,left:size.width*0.1,bottom:size.width*0.04,),
      elevation: 1,
      actionsPadding: EdgeInsets.only(bottom: size.width*0.055),
      actionsAlignment: MainAxisAlignment.center,
      alignment: Alignment.center,
      title: CircleAvatar(
        backgroundColor: kRedColor,
        radius: 23,
        child: Icon(Icons.delete,color: Colors.white,size: size.width*0.08 ),
      ),


      titleTextStyle: TextStyle(color: kRedColor,fontSize: size.width*0.06),
      content: Text('Are you sure delete this Item?',textAlign: TextAlign.center,style: TextStyle(height: size.width*0.0045),),
      actions: [
        SizedBox(
          width:size.width*0.25,
          height: size.width*0.1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: kLightBlueColor
            ),
            onPressed: onPressd, child: Text('Yes',style: TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold, color: Colors.white),),

          ),
        ),
        SizedBox(width: size.width*0.001),
        SizedBox(
          width:size.width*0.25,
          height: size.width*0.1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: kLightGreyColor
            ),
            onPressed: (){Get.back();},
            child: Text('No',style: TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold, color: kRedColor),),),
        ),
      ],
    ),
    );
  }
}
