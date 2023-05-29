import 'package:final_app/assets/constant.dart';
import 'package:final_app/controllers/form_list_controller.dart';
import 'package:final_app/models/customer.dart';
import 'package:final_app/widgets/snak_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TextFieldController extends GetxController {
  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? dateOfBirth;
  TextEditingController? phoneNumber;
  TextEditingController? email;
  TextEditingController? bankAccountNumber;
  final formKey = GlobalKey<FormState>();

///// DateTime Validation

  DateTime? chosenDateTime;

  //android datepicker
  androidDatePicker(BuildContext context) async {
    chosenDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate != null) {
        dateOfBirth!.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    });
    // dateOfBirth!.text = chosenDateTime!.toIso8601String();
  }

  //ios date picker
  iosDatePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                chosenDateTime = value;
              },
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumYear: 3000,
            ),
          );
        });
  }

  String? datePickerValidator(String date) {
    if (date.isEmpty) {
      return 'Field can not be Empty';
    }
    return null;
  }

///// FirstName & lastName Validation

  String? nameValidator(String value1) {
    RegExp nameRegExp = RegExp(r"^[a-zA-Z]+$");
    if (value1.isEmpty) {
      return 'Field can not be Empty';
    } else if (!nameRegExp.hasMatch(value1)) {
      return 'Please enter valid character';
    } else if (value1.length < 3) {
      return 'Too short';
    }
    return null;
  }

///// Email Validation
  String? emailValidator(String mail) {
    String pattern = r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$';
    RegExp regExp = RegExp(pattern);
    if (mail.isEmpty || !regExp.hasMatch(mail)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

///// Phone Number Validation for "Iran"
  String? validateMobile(String phoneNumber) {
    String pattern = r'^(\+98?)?{?(0?9[0-9]{9,9}}?)$';
    RegExp regExp = RegExp(pattern);
    if (phoneNumber.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(phoneNumber)) {
      return 'Please enter valid mobile number';
    }

    return null;
  }

///// card Bank  Validation
  String? validateBank(String bankNumber) {
    String pattern = "[0-9]{9,18}";
    RegExp regExp = RegExp(pattern);
    if (bankNumber.isEmpty) {
      return 'Please enter Bank account number';
    } else if (!regExp.hasMatch(bankNumber)) {
      return 'Please enter valid number';
    }
    return null;
  }

  String? invalidCustomer() {
    var customerList = Get.find<FormListController>().formList;



    for (var customer in customerList) {
      if (Get.find<FormListController>().isEditing) {
         var item = customerList[Get.find<FormListController>().id];

        if (customer != item) {
          if (customer.firstName == firstName!.text &&
              customer.lastName == lastName!.text &&
              customer.dateOfBirth == dateOfBirth!.text) {
            return 'Duplicate Firstname, Lastname and DateOfBirth.';
          }

          if (customer.email == email!.text) {
            return "Duplicate Email!";
          }
        }
      }
      else{
        if (customer.firstName == firstName!.text &&
            customer.lastName == lastName!.text &&
            customer.dateOfBirth == dateOfBirth!.text) {
          return 'Duplicate Firstname, Lastname and DateOfBirth.';
        }

        if (customer.email == email!.text) {
          return "Duplicate Email!";
        }
      }
    }

    return null;
  }

  saveButton() {
    if (Get.find<FormListController>().isEditing &&
        formKey.currentState!.validate()) {
      var item = Get.find<FormListController>()
          .formList[Get.find<FormListController>().id];
      var controller = Get.find<TextFieldController>();
      item.firstName = controller.firstName!.text;
      item.lastName = controller.lastName!.text;
      item.dateOfBirth = controller.dateOfBirth!.text;
      item.phoneNumber = controller.phoneNumber!.text;
      item.email = controller.email!.text;
      item.bankAccountNumber = controller.bankAccountNumber!.text;

      Get.find<FormListController>()
          .formList[Get.find<FormListController>().id] = item;
      Get.back();
    } else if (formKey.currentState!.validate()) {
      var controller = Get.find<TextFieldController>();
      Get.find<FormListController>().formList.add(Customer(
            firstName: controller.firstName!.text,
            lastName: controller.lastName!.text,
            dateOfBirth: controller.dateOfBirth!.text,
            phoneNumber: controller.phoneNumber!.text,
            email: controller.email!.text,
            bankAccountNumber: controller.bankAccountNumber!.text,
          ));
      Get.back();
    }
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    dateOfBirth = TextEditingController();
    phoneNumber = TextEditingController();
    email = TextEditingController();
    bankAccountNumber = TextEditingController();

    super.onInit();
  }
}
