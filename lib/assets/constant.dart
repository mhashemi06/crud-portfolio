import 'package:final_app/assets/math_utils.dart';
import 'package:flutter/material.dart';


//////// Images

class ImageConstant {
  static Widget empty = Image.asset('lib/assets/images/empty-page-icon.jpg',);
}



//////// Text Style

class AppStyle{
  static TextStyle boldFont22Blue = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: kLightBlueColor,
  );
  static TextStyle boldFont22Black =  TextStyle(
    fontSize: size.width*0.055,
    fontWeight: FontWeight.bold,
    color: kBlackColor,
  );
  static TextStyle normalFont04Black = TextStyle(
    fontSize: size.width*0.04,
    color: Colors.black87,
  );
}



//////// Decoration

class AppDecoration{

  static BoxDecoration get listItemBox =>   BoxDecoration(
    color:Colors.white,
    boxShadow: const [
      BoxShadow(
        color: Color(0xffbec3d5),
        blurRadius: 3, // soften the shadow
        spreadRadius:1, //extend the shadow
        offset: Offset(0, 0,),
      ),
    ],
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration get headerItem => const BoxDecoration(
    color: Color(0xffecedf1),

    borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft:  Radius.circular(10)
    ),

  );
}


//////// Colors

const kBlackColor=Colors.black87;
const kLightBlueColor= Color(0xff5886ff);
const kLightGreyColor =Color(0xffe8e8e8);
const kRedColor = Color(0xffec5c5c);
const kPinkColor = Color(0xffec417a);
const kGreenColor =Color(0xff2dc254);


