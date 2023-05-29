import 'package:final_app/assets/constant.dart';
import 'package:final_app/assets/math_utils.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width*0.75,
          height: size.width*0.75,
            child: ImageConstant.empty
        ),
      SizedBox(height: size.width*0.02,),
        Text('There are no items to display ...',style: AppStyle.normalFont04Black,),
        SizedBox(height: size.width*0.3,),
      ],
    );

  }
}
