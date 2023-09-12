import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_link.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(
        ApiLink.verifycode, {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
