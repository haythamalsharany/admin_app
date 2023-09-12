import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle: const TextStyle(
          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: "هل تريد الخروج من التطبيق",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child: const Text("تاكيد")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: const Text("الغاء"))
      ]);
  return Future.value(true);
}

/*Future<bool> alertRating(bool isEdit) {
  ItemDetailsControllerImp controller = Get.find();
  Get.defaultDialog(
      title: "Alert",
      titleStyle: const TextStyle(
          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: "Rate Item",
      content: GetBuilder<ItemDetailsControllerImp>(builder: (logic) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    5,
                    (index) => InkWell(
                          onTap: () {
                            controller.changeUserRateVal(index);
                          },
                          child: Icon(
                            index <= controller.userRateVal
                                ? Icons.star
                                : Icons.star_border_outlined,
                            size: 35,
                            color: AppColor.primaryColor,
                          ),
                        ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormAuth(
                    hinttext: 'Add comment',
                    iconData: Icons.add_comment_outlined,
                    isNumber: false,
                    labeltext: 'Add comment',
                    mycontroller: controller.addCommenController,
                    valid: (String? val) {
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      }),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              if (!isEdit) {
                controller.addItemRating();
              } else {
                controller.editItemRating();
              }

              Get.back();
            },
            child: const Text("Send")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"))
      ]);
  return Future.value(true);
}

deleteAlert(CommentRateModel comment) {
  ItemDetailsControllerImp controller = Get.find();
  Get.defaultDialog(title: 'Warning', middleText: 'Are you sure ?', actions: [
    ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.primaryColor)),
        onPressed: () {
          controller.onEdit('', id: comment.commentRateId!);
          controller.deleteItemRating();
          Get.back();
        },
        child: const Text("Delete")),
    ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.primaryColor)),
        onPressed: () {
          Get.back();
        },
        child: const Text("Cancel"))
  ]);
}*/
