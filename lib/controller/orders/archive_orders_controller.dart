import 'dart:developer';

import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';

import '../../data/data_source/remote/orders/archive_data.dart';
import '../../data/models/orders_model.dart';
import 'pindings_orders_controller.dart';

class ArchiveOrdersController extends OrdersController {
  OrdersArchuiveData ordersArchuiveData = OrdersArchuiveData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> archiveOrders = [];
  StatusRequest statusRequest = StatusRequest.none;

  getArchiveOrders() async {
    archiveOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchuiveData
        .getData(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
   
    log(' ordersArchuiveData : $response');
    if (statusRequest == StatusRequest.success) {
       log(' statusRequest : $statusRequest');
      if (response['status'] == 'success') {
        log(' response : ${response['status'] }');
        List dataList = response['data'];
        archiveOrders
            .addAll(dataList.map((e) => OrdersModel.fromJson(e)).toList());
            log(' archiveOrders : ${archiveOrders.length}');
        if (archiveOrders.isEmpty) {
          statusRequest = StatusRequest.failure;
        
        }
        
      }
      else{
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  void onInit() {
    getArchiveOrders();
    super.onInit();
  }
}
