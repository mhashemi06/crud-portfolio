import 'package:final_app/assets/constant.dart';
import 'package:final_app/assets/math_utils.dart';
import 'package:final_app/controllers/form_list_controller.dart';
import 'package:final_app/controllers/textField_controller.dart';
import 'package:final_app/widgets/header_form_widget.dart';
import 'package:final_app/widgets/snak_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormScreen extends GetWidget<TextFieldController>  {
  FormScreen({Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController(initialScrollOffset: size.height*0.026);
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();
  FocusNode f7 = FocusNode();
  // late String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderFormWidget(),
              Container(
                margin: EdgeInsets.symmetric(horizontal:size.width*0.08 ),
                child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [

                        // FirstName
                        TextFormField(
                          focusNode: f1,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(f2);
                          },
                          validator: (value) {
                            return controller.nameValidator(value!);
                          },
                          controller: controller.firstName!,
                          maxLength: 20,
                          textInputAction: TextInputAction.next,
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            counterText: "",
                          ),
                        ),

                        SizedBox(height:size.width*0.01),

                        // LastName
                        TextFormField(
                          focusNode: f2,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(f3);
                          },
                          validator: (value) {
                            return controller.nameValidator(value!);
                          },
                          controller: controller.lastName!,
                          maxLength: 25,
                          textInputAction: TextInputAction.next,
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            counterText: "",
                          ),
                        ),

                        SizedBox(height:size.width*0.01),

                        // Date Of birth
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              focusNode: f3,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(f4);
                              },
                              validator: (value) {
                                return controller.datePickerValidator(value!);
                              },
                              controller: controller.dateOfBirth!,
                              autovalidateMode:AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.none,
                              decoration: const InputDecoration(
                                  labelText: 'Date of Birth'
                              ),
                            ),

                            SizedBox(
                              width: 40,
                              height: 40,
                              child: InkWell(
                                child:const Center(child: Icon(Icons.calendar_month,color: kLightBlueColor,),),
                                onTap: () {
                                  if (defaultTargetPlatform == TargetPlatform.macOS ||
                                      defaultTargetPlatform == TargetPlatform.iOS) {
                                    controller.iosDatePicker(context);
                                  } else {
                                    controller.androidDatePicker(context);
                                  }
                                },
                              ),


                            ),
                          ],
                        ),

                        SizedBox(height:size.width*0.01),

                        // Phone Number
                        TextFormField(
                          focusNode: f4,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(f5);
                          },
                          validator: (value) {
                            return controller.validateMobile(value!);
                          },
                          controller: controller.phoneNumber!,
                          maxLength: 11,
                          textInputAction: TextInputAction.next,
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            counterText: "",
                          ),
                        ),

                        SizedBox(height:size.width*0.01),

                        // Email
                        TextFormField(
                          focusNode: f5,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(f6);
                          },
                          validator: (value) {
                            // email=value!;
                            return controller.emailValidator(value!);

                          },
                          controller: controller.email!,
                          maxLength: 30,
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            counterText: "",
                          ),
                        ),

                        SizedBox(height:size.width*0.01),

                        // Bank account number
                        TextFormField(
                          focusNode: f7,
                          validator: (value) {
                            return controller.validateBank(value!);
                          },
                          controller: controller.bankAccountNumber!,
                          maxLength: 14,
                          textInputAction: TextInputAction.next,
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Bank account number',
                            counterText: "",
                          ),
                        ),

                        SizedBox(height:size.width*0.1),
                      ],
                    )),
              ),


              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal:size.width*0.08 ),
                  height: size.width*0.12,
                  child: ElevatedButton(
                      onPressed: (){

                        if(controller.formKey.currentState!.validate()){
                          var duplicateCustomer= controller.invalidCustomer();

                          if(duplicateCustomer != null){
                            showSnackBarModal(
                                text: 'Error',
                                subText: duplicateCustomer,
                                color: kRedColor,
                                icon: Icons.error_outline
                            );
                          }

                          else{
                            controller.saveButton();
                            showSnackBarModal(
                              text: 'Successful',
                              subText: 'This Operation is Complete',
                              color: kGreenColor,
                              icon: Icons.check_circle,
                            );}
                        }
                        else{
                          showSnackBarModal(
                              text: 'Error',
                              subText: 'This Operation is failed',
                              color: kRedColor,
                              icon: Icons.error_outline
                          );
                        }


                      },
                      child: Text( Get.find<FormListController>().isEditing?'Edit':'Add')))
            ],
          ),
        ),
      ),
    );
  }


}
