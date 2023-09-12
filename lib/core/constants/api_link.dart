class ApiLink {
  //static const String baseUrl='http://localhost/myEccommerceApi/';
  // static const String baseUrl='10.0.0.160/myEcommerceApi/';
  static const String baseUrl = 'http://10.0.2.2/myEccommerceApi/admin';
  static const String test = '$baseUrl/test.php';

  //===================== image ======================//
  static const String imageUrl = '$baseUrl/upload';
  static const String categoriesImageUrl = '$imageUrl/categories';
  static const String itemsImageUrl = '$imageUrl/items';
  //===================== Auth ======================//

  static const String login = '$baseUrl/auth/login.php';
  static const String resend = '$baseUrl/auth/resend.php';

  //===================== forgot password ======================//
  static const String verifycode = '$baseUrl/forgetPassword/verifycode.php';
  static const String checkEmail = '$baseUrl/forgetPassword/checkEmail.php';
  static const String resetPassword =
      '$baseUrl/forgetPassword/resetPassword.php';
  //===================== orders ======================//

  static const String pindingOrdersView = '$baseUrl/orders/pending.php';
  static const String approveOrder = '$baseUrl/orders/approve.php';
  static const String doneOrder = '$baseUrl/orders/done.php';
  static const String archiveOrdersView = '$baseUrl/orders/archive.php';
  static const String acceptedOrdersView = '$baseUrl/orders/accepted.php';

  static const String orderDetails = '$baseUrl/orders/details.php';
}
