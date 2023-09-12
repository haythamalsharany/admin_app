import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(ApiLink.checkEmail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
