import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: unused_import

import '../../../controller/orders/accepted_orders_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widgets/orders/orders_list_card.dart';

class AcceptedOrders extends StatelessWidget {
  const AcceptedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedOrdersController());
    return GetBuilder<AcceptedOrdersController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
            itemCount: controller.acceptedOrders.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: OrdersListCard(
                  ordersModel: controller.acceptedOrders[index],
                  controller: controller,
                ),
              );
            }),
      );
    });
  }
}
