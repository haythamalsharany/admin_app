import 'dart:developer';

import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/data_source/remote/orders/orders_details_data.dart';
import '../../data/models/cart_model.dart';
import '../../data/models/orders_model.dart';


class OrdersDetailsController extends GetxController {
  final _ordersDetailsData = OrdersDetailsData(Get.find());

  late OrdersModel ordersModel;
  List<CartModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    var response = await _ordersDetailsData.getData(ordersModel.ordersId!);

    statusRequest = handlingData(response);
    log('response:$response');
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['orderModel'];
    getOrderDetails();
    super.onInit();
  }
}
