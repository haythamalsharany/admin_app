
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/data_source/remote/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail(); 
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  
  CheckEmailData checkEmailData  = CheckEmailData(Get.find()) ; 

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  
  StatusRequest statusRequest  = StatusRequest.none ;  

  late TextEditingController email;

  @override
  checkemail() async  {
    if (formstate.currentState!.validate()){
       statusRequest = StatusRequest.loading; 
      update() ; 
      var response = await checkEmailData.postdata(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCode , arguments: {
            "email" : email.text
          });
        } else {
          Get.defaultDialog(title: "94".tr , middleText: "95".tr); 
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

 
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
