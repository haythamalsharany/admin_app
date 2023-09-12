import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_sceen_controller.dart';
import '../widgets/custom_bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
        key: const ValueKey('Scaffold'),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: controller.pages.elementAt(controller.currentPage).values.first,
      );
    });
  }
}
