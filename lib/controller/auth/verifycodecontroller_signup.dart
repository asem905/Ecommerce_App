// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class VerifyCodeController extends GetxController{
  CheckEmail();
  GoToSuccessResetPassword();
   GoToSuccessSignUp(String verificationCode);
   resendCode();
  
}
class VerifyCodeControllerImp extends VerifyCodeController{
  VerifyCodeSignUpData verifyCodesignupdata=VerifyCodeSignUpData(Get.find());
  
  String? email;
  Statusrequest? statusrequest;
  @override
  CheckEmail() {
    
  }
  
  @override
  GoToSuccessSignUp(String verificationCode) async{
      statusrequest=Statusrequest.loading;
      update();
      var response=await verifyCodesignupdata.postdata(email!, verificationCode);
      statusrequest=handlingData(response);
      print(statusrequest.toString());
      if(statusrequest==Statusrequest.success){
        if(response['status']=="success"){
              // data.addAll(response['success']);
              // print(data);
              Get.offNamed(AppRoute.successSignup);
        }else{
              Get.defaultDialog(
                title: "Warning",
                middleText: "Verify Code Isn't Correct",
              );
              statusrequest=Statusrequest.failure;
              
        }
    
    }
    
  }
  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }
  
  @override
  GoToSuccessResetPassword() {
    AppRoute.resetPassword;
  }
  
  @override
  resendCode() {
    verifyCodesignupdata.resenddata(email!);
  }
}

  