import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/orders/accepted_orders.dart';
import '../view/screens/orders/pinding_orders.dart';
import '../view/screens/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Map<String, dynamic>> pages = [
    {'76'.tr: const PindingOrders(), 'icon': Icons.downloading_outlined},
    {'82'.tr: const AcceptedOrders(), 'icon': Icons.download_done_outlined},
    {'83'.tr: const SettingsPage(), 'icon': Icons.settings}
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
