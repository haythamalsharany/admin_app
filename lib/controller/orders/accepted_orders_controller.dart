import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/data_source/remote/orders/accepted_orders_data.dart';
import '../../data/models/orders_model.dart';
import 'pindings_orders_controller.dart';

class AcceptedOrdersController extends OrdersController {
  final AcceptedOrdersData _acceptedOrdersData = AcceptedOrdersData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> acceptedOrders = [];
  StatusRequest statusRequest = StatusRequest.none;

  getAcceptedOrders() async {
    statusRequest = StatusRequest.loading;
    update();

    log(' userId --------------------------: ${myServices.sharedPreferences.getString('id')!}');
    var response = await _acceptedOrdersData
        .getAcceptedOrders(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);

    log(' acceptedOrders : $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        acceptedOrders.clear();
        List dataList = response['data'];
        acceptedOrders
            .addAll(dataList.map((e) => OrdersModel.fromJson(e)).toList());

        if (acceptedOrders.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  makeDoneOrder(String orderId, String userId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await _acceptedOrdersData.makeDoneOrder(orderId, userId);
    statusRequest = handlingData(response);

    log(' makeDoneOrder : $response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "69".tr, messageText:  Text('71'.tr));
        getAcceptedOrders();
      }
      {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  refreshOrders() {
    getAcceptedOrders();
  }

  @override
  void onInit() {
    getAcceptedOrders();
    super.onInit();
  }
}
