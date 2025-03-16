import 'package:ecommerce/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class Checkemailcontroller extends GetxController{
  CheckEmail();
  GoToVerifyCode();
}
class CheckemailcontrollerImp extends Checkemailcontroller{
  
  late TextEditingController email;
  late TextEditingController phone;
  GlobalKey<FormState> formstate5=GlobalKey<FormState>();
  @override
  CheckEmail() {
    var formdata=formstate5.currentState;
    if(formdata != null){
      if(formdata.validate()){
        Get.toNamed(AppRoute.verifyCode);
      }else{
        print("InValid===============================");
      }
    }
  }
  
  @override
  GoToVerifyCode() {
    
    
  }
  @override
  void onInit() {
    email=TextEditingController();
    phone=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    super.dispose();
  }
}