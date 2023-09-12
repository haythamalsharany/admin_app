import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/archive_orders_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widgets/orders/orders_list_card.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text('84'.tr),
      ),
      body: GetBuilder<ArchiveOrdersController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
              itemCount: controller.archiveOrders.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: OrdersListCard(
                      ordersModel: controller.archiveOrders[index],
                      controller: controller),
                );
              }),
        );
      }),
    );
  }
}
