import 'package:get/get.dart';


import 'core/constants/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screens/auth/forgetpassword/forgetpassword.dart';
import 'view/screens/auth/forgetpassword/resetpassword.dart';
import 'view/screens/auth/forgetpassword/success_resetpassword.dart';
import 'view/screens/auth/forgetpassword/verifycode.dart';
import 'view/screens/auth/login.dart';

import 'view/screens/home_screen.dart';
import 'view/screens/language.dart';
import 'view/screens/orders/archive_orders.dart';
import 'view/screens/orders/order_details.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.ordersarchive, page: () => const ArchiveOrders()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrderDetails()),
  GetPage(name: AppRoute.lang, page: () => const Language()),
];
