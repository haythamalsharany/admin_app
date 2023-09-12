import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import '../../../controller/orders/orders_details_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/translate_database.dart';
import '../../../core/shared/custom_title.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text('85'.tr),
        ),
        body: GetBuilder<OrdersDetailsController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text(
                                  '86'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '87'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '55'.tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                              ...List.generate(controller.data.length, (index) {
                                return TableRow(children: [
                                  Text(
                                    translateDatabase(
                                        arText:
                                            controller.data[index].itemsNameAr!,
                                        enText:
                                            controller.data[index].itemsName!),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    controller.data[index].itemCount!,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${controller.data[index].itemPrice!} \$',
                                    textAlign: TextAlign.center,
                                  )
                                ]);
                              })
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              '${'56'.tr} : ${controller.ordersModel.ordersTotalprice}! \$',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTitle(
                                title: '88'.tr,
                              ),
                              Text(
                                  '${'89'.tr} : ${controller.ordersModel.addressCity!} '),
                              Text(
                                  '${'90'.tr} :  ${controller.ordersModel.addressStreet!}  '),
                              Text(
                                  '${'91'.tr} : ${controller.ordersModel.addressName!}  ')
                            ],
                          )),
                    ),
                    Card(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 300,
                            width: double.infinity,
                            child: OpenStreetMapSearchAndPick(
                                locationPinText: '92'.tr,
                                center: LatLong(
                                    double.parse(
                                        controller.ordersModel.addressLat!),
                                    double.parse(
                                        controller.ordersModel.addressLong!)),
                                buttonHeight: 1,
                                buttonText: '',
                                buttonColor: Colors.transparent,
                                onPicked: (pickedData) {})))
                  ],
                ));
          },
        ));
  }
}
