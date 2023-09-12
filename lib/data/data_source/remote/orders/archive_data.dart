import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class OrdersArchuiveData {
  final Crud crud;

  OrdersArchuiveData(this.crud);

  getData(String deliveryId) async {
    var response =
        await crud.postData(ApiLink.archiveOrdersView, {'deliveryId': deliveryId});
    return response.fold((l) => 1, (r) => r);
  }

  
}
