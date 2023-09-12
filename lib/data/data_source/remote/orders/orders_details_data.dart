



import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class OrdersDetailsData {
  final Crud crud;

  OrdersDetailsData(this.crud);

  getData(String orderId) async {
    var response =
        await crud.postData(ApiLink.orderDetails, {'orderId': orderId});
    return response.fold((l) => 1, (r) => r);
  }
}