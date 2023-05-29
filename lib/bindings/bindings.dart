import 'package:final_app/controllers/form_list_controller.dart';
import 'package:final_app/controllers/textField_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(TextFieldController());
  Get.lazyPut(() => FormListController());

  }

}
