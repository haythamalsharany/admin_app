import 'package:get/get.dart';


import '../services/services.dart';

String translateDatabase({String? arText, String? enText}) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString('lang') == 'ar') {
    return arText ?? 'null';
  } else {
    return enText ?? 'null';
  }
}
