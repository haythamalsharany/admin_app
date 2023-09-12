import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email, String password) async {
    
    var response = await crud
        .postData(ApiLink.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
