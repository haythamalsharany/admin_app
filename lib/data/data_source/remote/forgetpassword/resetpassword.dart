import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String email, String password) async {
    var response = await crud.postData(
        ApiLink.resetPassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
