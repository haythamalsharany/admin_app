import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: unused_import

import '../../../controller/orders/pindings_orders_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widgets/orders/orders_list_card.dart';

class PindingOrders extends StatelessWidget {
  const PindingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PindingsOrdersController());
    return GetBuilder<PindingsOrdersController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
              itemCount: controller.pindingsOrders.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: OrdersListCard(
                    ordersModel: controller.pindingsOrders[index],
                    controller: controller,
                  ),
                );
              }),
        );
      }
    );
  }
}
