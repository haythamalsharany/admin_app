

import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class OrdersPindingsData {
  final Crud crud;

  OrdersPindingsData(this.crud);

  getPindingOrders() async {
    var response =
        await crud.postData(ApiLink.pindingOrdersView, {});
    return response.fold((l) => 1, (r) => r);
  }


  approveOrder(String orderId,String userId,String deliveryId) async {
    var response =
        await crud.postData(ApiLink.approveOrder, {
          'orderId': orderId,
          'userId': userId,
          'deliveryId': deliveryId,
          });
    return response.fold((l) => 1, (r) => r);
  }
}
