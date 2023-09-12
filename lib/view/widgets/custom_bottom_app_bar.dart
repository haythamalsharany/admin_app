import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/color.dart';
import '../../controller/home_sceen_controller.dart';

import 'home/custom_bottom_button.dart';

class CustomBottomAppBar extends GetView<HomeScreenControllerImp> {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            controller.pages.length,
            (index) {
              return GetBuilder<HomeScreenControllerImp>(builder: (logic) {
                return CustomBottomNavButton(
                  activeColor: logic.currentPage == index
                      ? AppColor.primaryColor
                      : AppColor.grey2,
                  buttonText: logic.pages[index].keys.first,
                  buttonIcon: logic.pages[index]['icon'],
                  onPressed: () => logic.changePage(index),
                );
              });
            },
          )
        ],
      ),
    );
  }
}
