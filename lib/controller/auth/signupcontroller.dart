import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class SignUpcontroller extends GetxController{
  SignUp();
  GoToLogin();
}
class SignUpcontrollerImp extends SignUpcontroller{
  late TextEditingController email;
  late TextEditingController Password;
  late TextEditingController username;
  late TextEditingController phone;
  SignUpData signup_data=SignUpData(Get.find());
  List data=[];
  Statusrequest statusrequest=Statusrequest.none;
  GlobalKey<FormState> formstate2=GlobalKey<FormState>();
  bool isShowPassword=true;
  showPassword(){
    isShowPassword=isShowPassword==false?true:false;
    update();
  }
  @override
SignUp() async{
    var formdata=formstate2.currentState;
    if(formdata != null){
        if(formdata.validate()){
          statusrequest=Statusrequest.loading;
          update();
          var response=await signup_data.postdata(username.text,email.text,Password.text,phone.text);
          statusrequest=handlingData(response);
          print(statusrequest.toString());
          if(statusrequest==Statusrequest.success){
            if(response['status']=="success"){
              // data.addAll(response['success']);
              // print(data);
              Get.offNamed(AppRoute.verifyCode,arguments: {
                "email":email.text
              });
            }else{
              Get.defaultDialog(
                title: "Error",
                middleText: "Phone number Or Email Already Exists",
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
  
  @override
  GoToLogin() {
    Get.offNamed(AppRoute.login);
  }
  @override
  void onInit() {
    email=TextEditingController();
    Password=TextEditingController();
    phone=TextEditingController();
    username=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    phone.dispose();
    username.dispose();
    email.dispose();
    Password.dispose();
    super.dispose();
  }
}