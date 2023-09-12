

import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class AcceptedOrdersData {
  final Crud crud;

  AcceptedOrdersData(this.crud);

  getAcceptedOrders(String deliveryId) async {
    var response =
        await crud.postData(ApiLink.acceptedOrdersView, {
          'deliveryId': deliveryId,
        });
    return response.fold((l) => 1, (r) => r);
  }


  makeDoneOrder(String orderId,String userId) async {
    var response =
        await crud.postData(ApiLink.doneOrder, {
          'orderId': orderId,
          'userId': userId,
          
          });
    return response.fold((l) => 1, (r) => r);
  }
}
