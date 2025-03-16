import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class ForgetPasswordcontroller extends GetxController{
  CheckEmail();

}
class ForgetPasswordcontrollerImp extends ForgetPasswordcontroller{
  GlobalKey<FormState> formstate3=GlobalKey<FormState>();
  late TextEditingController email;
  CheckEmailData checkEmaildata=CheckEmailData(Get.find());
  Statusrequest statusrequest=Statusrequest.none;
  @override
  CheckEmail() async {
    if(formstate3.currentState!.validate()){
      statusrequest=Statusrequest.loading;
          update();
          var response=await checkEmaildata.postdata(email.text);
          statusrequest=handlingData(response);
          print(statusrequest.toString());
          if(statusrequest==Statusrequest.success){
            if(response['status']=="success"){
              // data.addAll(response['success']);
              // print(data);
              Get.offNamed(AppRoute.verifyCode_forgetpassword,arguments: {
                "email":email.text
              });
            }else{
              Get.defaultDialog(
                title: "Error",
                middleText: "Email Is Wrong",
              );
              statusrequest=Statusrequest.failure;
            }
        }
        update();
    }
  }
  
  @override

  @override
  void onInit() {
    email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}