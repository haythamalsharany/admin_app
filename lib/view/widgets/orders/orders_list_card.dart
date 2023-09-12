import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archive_orders_controller.dart';
import '../../../controller/orders/pindings_orders_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/routes.dart';
import '../../../data/models/orders_model.dart';

class OrdersListCard extends StatelessWidget {
  final OrdersModel ordersModel;
  final OrdersController controller;
  const OrdersListCard(
      {super.key, required this.ordersModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${'65'.tr} : ${ordersModel.ordersId}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                Jiffy(
                  ordersModel.ordersDatetime,
                  "yyyy-MM-dd",
                ).fromNow().toString(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor),
              )
            ],
          ),
          const Divider(
            height: 20,
          ),
          Text(
            '${'66'.tr} : ${ordersModel.ordersPrice} \$',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            '${'67'.tr} : ${ordersModel.ordersPricedelivery}  \$',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            '${'68'.tr} :${controller.getOrderPaymentMethod(ordersModel.ordersPaymentmethod!)} ',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              height: 30,
            ),
          ),
          Row(
            children: [
              Text('${'56'.tr} : ${ordersModel.ordersTotalprice} \$',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                color: AppColor.thirdColor,
                onPressed: () {
                  Get.toNamed(AppRoute.ordersdetails,
                      arguments: {'orderModel': ordersModel});
                },
                child: Text('61'.tr,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor)),
              ),
              const SizedBox(
                width: 5,
              ),
              controller is! ArchiveOrdersController
                  ? MaterialButton(
                      color: AppColor.thirdColor,
                      onPressed: () {
                        if (controller is PindingsOrdersController) {
                          controller.approveOrder(ordersModel.ordersId!,
                              ordersModel.ordersUsersid!);
                        } else {
                          controller.makeDoneOrder(ordersModel.ordersId!,
                              ordersModel.ordersUsersid!);
                        }
                      },
                      child: Text(
                          controller is PindingsOrdersController
                              ? '63'.tr
                              : '64'.tr,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor)),
                    )
                  : const SizedBox()
            ],
          ),
        ]),
      ),
    );
  }
}
