// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/data_source/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>(
    debugLabel: 'GlobalFormKey #SignIn',
  );

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);

      statusRequest = handlingData(response);
      log('login : $response');
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);

          log('response -------------------------------------------------------');
          if (response['data']['driver_approve'] == "1") {
            log('drive_approve -------------------------------------------------------');
            var sharedPreferences = myServices.sharedPreferences
              ..setString("id", response['data']['driver_id'])
              ..setString("username", response['data']['driver_name'])
              ..setString("email", response['data']['driver_email'])
              ..setString("phone", response['data']['driver_phone'])
              ..setString("step", "1");
            String userid = sharedPreferences.getString("id")!;
           
            String step = sharedPreferences.getString("step")!;
            log('userid :$userid');
            log('step :$step');

            FirebaseMessaging.instance.subscribeToTopic("user");
            FirebaseMessaging.instance.subscribeToTopic("delivery");

            FirebaseMessaging.instance.subscribeToTopic("user$userid");
            FirebaseMessaging.instance.subscribeToTopic("delivery$userid");

            Get.offNamed(AppRoute.homeScreen);
          } else {
             Get.defaultDialog(
              title: "94".tr, middleText: "93".tr);
            
          }
        } else {
          
          Get.defaultDialog(
              title: "94".tr, middleText: "93".tr);
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
      log('token = $token');
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
