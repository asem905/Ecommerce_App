import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class ResetPasswordController extends GetxController{
  ResetPassword();
  GoToSuccessResetPassword();
}
class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController password;
  late TextEditingController rePassword;
  String? email;
  Statusrequest statusrequest=Statusrequest.none;
  ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
  GlobalKey<FormState> formstate4=GlobalKey<FormState>();
  @override
  ResetPassword() {
    
  }
  
  @override
  GoToSuccessResetPassword() async{
    var formdata=formstate4.currentState;
    if(password.text !=rePassword.text){
      return Get.defaultDialog(title: "Error",
      middleText: "password isn't matching"
      );
    }else{
      if(formdata != null){
        if(formdata.validate()){
          statusrequest=Statusrequest.loading;
          update();
          var response=await resetPasswordData.postdata(email!,rePassword.text) ;
          statusrequest=handlingData(response);
          print(statusrequest.toString());
          if(statusrequest==Statusrequest.success){
            if(response['status']=="success"){
              Get.offNamed(AppRoute.successresetPassword);
            }else{
              Get.defaultDialog(
                title: "Error",
                middleText: "Try Again",
              );
              statusrequest=Statusrequest.failure;
            }
        }
        update();
        //Get.delete<SignUpcontrollerImp>();//we used lazyput instead
    }else{
        print("InValid===============================");
    }
   }
    }
  }
  @override
  void onInit() {
    email=Get.arguments['email'];
    password=TextEditingController();
    rePassword=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}