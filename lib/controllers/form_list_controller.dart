import 'package:final_app/controllers/textField_controller.dart';
import 'package:final_app/models/customer.dart';
import 'package:final_app/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FormListController extends GetxController {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? dateOfBirth;
  String? bankAccountNumber;
  String? email;

  bool isEditing = false;
  int id = 0;

  var formList = <Customer>[].obs;
  var filteredList = <Customer>[].obs;

  // Search bar
  TextEditingController searchBox = TextEditingController();

  void search(text) {
    if (text.isEmpty) {
      filteredList.assignAll(formList);
    }

    else {
      filteredList.assignAll(formList.where((item) {
        return item.firstName!.contains(text.toLowerCase()) ||
            item.lastName!.contains(text.toLowerCase()) ||
            item.phoneNumber!.contains(text.toLowerCase());
      }
      ));
    }
  }

  myFloatingAction() {
    Get.find<FormListController>().isEditing = false;
    Get.find<TextFieldController>().firstName!.text = '';
    Get.find<TextFieldController>().lastName!.text = '';
    Get.find<TextFieldController>().dateOfBirth!.text = '';
    Get.find<TextFieldController>().email!.text = '';
    Get.find<TextFieldController>().phoneNumber!.text = '';
    Get.find<TextFieldController>().bankAccountNumber!.text = '';
  }

  formValue() {
    Get.find<FormListController>().isEditing = true;

    Get.find<TextFieldController>().firstName!.text =
        Get.find<FormListController>().formList[id].firstName!;

    Get.find<TextFieldController>().lastName!.text =
        Get.find<FormListController>().formList[id].lastName!;

    Get.find<TextFieldController>().dateOfBirth!.text =
        Get.find<FormListController>().formList[id].dateOfBirth!;

    Get.find<TextFieldController>().email!.text =
        Get.find<FormListController>().formList[id].email!;

    Get.find<TextFieldController>().phoneNumber!.text =
        Get.find<FormListController>().formList[id].phoneNumber!;

    Get.find<TextFieldController>().bankAccountNumber!.text =
        Get.find<FormListController>().formList[id].bankAccountNumber!;
  }

  @override
  void onInit() {
    var box = GetStorage();
    if (box.read('formList') != null) {
      var list = box.read('formList');
      for (var item in list) {
        formList.add(Customer.fromJson(item));
      }
    }
    super.onInit();
    ever(formList, (callback) => box.write('formList', formList.toJson()));
  }
}
