import 'package:final_app/assets/constant.dart';
import 'package:final_app/assets/math_utils.dart';
import 'package:final_app/controllers/form_list_controller.dart';
import 'package:final_app/screens/list_screen.dart';
import 'package:final_app/widgets/add_button_widget.dart';
import 'package:final_app/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
class HomeScreen extends GetWidget<FormListController>  {
   HomeScreen({Key? key}) : super(key: key);
  // final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        floatingActionButton: const AddButtonWidget(),
        body:Column(

          children: [

            Container(
              // decoration: BoxDecoration(
              //   color: kLightBlueColor
              // ),
              padding: EdgeInsets.symmetric(vertical: size.width*0.01,horizontal: size.width*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: size.width*0.01,left: size.width*0.02),
                    child: Text('List',style: AppStyle.boldFont22Black),
                  ),
                  SizedBox(width: size.width*0.06,),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,

                      child:
                      SearchBarAnimation(

                        textAlignToRight: false,
                        isSearchBoxOnRightSide: true,
                        searchBoxColour: Colors.grey.shade200,
                        hintText: 'Search...',
                        isOriginalAnimation: false,
                        trailingWidget:const Icon(Icons.search,size: 21,color: kLightBlueColor,),
                        secondaryButtonWidget:const Icon(Icons.close,size: 23,),
                        buttonWidget: const Icon(Icons.search,size:25,),
                        onChanged:controller.search,
                        textEditingController: controller.searchBox ,
                        hintTextColour: Colors.black87,
                        onCollapseComplete: (){
                          controller.searchBox.clear();
                          controller.filteredList.clear();
                          // controller.search("");
                          // controller.formList.addAll(controller.formList);

                        },

                      ),
                    ),


                  ),
                ],
              ),

            ),


            Obx((){
              return  controller.formList.isEmpty?
              const Center(child: EmptyWidget(),)
                  :
              ListScreen();
            }),
          ],
        ),
      ),
    );
  }
}
