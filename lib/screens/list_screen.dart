import 'package:final_app/assets/constant.dart';
import 'package:final_app/assets/math_utils.dart';
import 'package:final_app/controllers/form_list_controller.dart';
import 'package:final_app/widgets/empty_widget.dart';
import 'package:final_app/widgets/show_dialog_widget.dart';
import 'package:final_app/widgets/snak_bar_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:get_storage/get_storage.dart';

class ListScreen extends GetWidget<FormListController> {
  ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: size.width*0.03),
        height: size.height * 0.8,

      child: Obx(() {
        if (controller.formList.isEmpty) {
          return const EmptyWidget();
        } else if (controller.filteredList.isEmpty && controller.searchBox.text.isNotEmpty) {
          return const EmptyWidget();
        } else {
          return createListCustomer(controller.filteredList.isNotEmpty ? controller.filteredList : controller.formList);
        }
      }));


  }




  ///// List of items Widget
  ListView createListCustomer(list) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) => SizedBox(height: size.width*0.06,),
      itemBuilder: (context, index) {
        final item = list[index];
        return Container(
            margin:
            EdgeInsets.symmetric(horizontal: size.width * 0.07),
            decoration: AppDecoration.listItemBox,
            child: Column(
              children: [
                //// Header Item: includes first and last name and edit and delete button.
                Container(
                  height: size.width * 0.12,
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.005,
                      horizontal: size.width * 0.04),
                  decoration: AppDecoration.headerItem,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Edit button
                          InkWell(
                            onTap: () {
                              Get.find<FormListController>().id =
                                  index;
                              controller.formValue();
                              Get.toNamed('/form_screen');
                            },
                            child: const Icon(
                              Icons.edit,
                              color: kLightBlueColor,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.025,
                          ),
                          Text(
                              '${item.firstName!} ${item.lastName!}')
                        ],
                      ),

                      // Delete button
                      InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    ShowDialogModal(
                                      onPressd: () {
                                        controller.formList
                                            .removeAt(index);
                                        Get.back();
                                        showSnackBarModal(
                                          text: 'Successful',
                                          subText:
                                          'This Operation is Complete',
                                          color: kGreenColor,
                                          icon: Icons.check_circle,
                                        );
                                      },
                                    ));
                          },
                          child: const Icon(
                            Icons.delete,
                            color: kRedColor,
                          ))
                    ],
                  ),
                ),

                //// Body Item:  includes other Items
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.04,
                      horizontal: size.width * 0.04),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          icon(icon: Icons.calendar_month),
                          Text(item.dateOfBirth!),
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.02,
                      ),
                      Row(
                        children: [
                          icon(icon: Icons.phone_android),
                          Text(item.phoneNumber!),
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.02,
                      ),
                      Row(
                        children: [
                          icon(icon: Icons.credit_card),
                          Text(item.bankAccountNumber!),
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.02,
                      ),
                      Row(
                        children: [
                          icon(icon: Icons.alternate_email),
                          SizedBox(
                              width: size.width * 0.55,
                              child: Text(item.email!)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  ///// Icon Widget
  Widget icon({var icon}) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.025),
      child: CircleAvatar(
        backgroundColor: kLightGreyColor,
        radius: 13,
        child: Icon(
          icon!,
          color: Colors.grey.shade500,
          size: 16,
        ),
      ),
    );
  }
}
