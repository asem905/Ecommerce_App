import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
abstract class Logincontroller extends GetxController{
  login();
  goToSignup();
  GoToForgetPassword();
}
class LogincontrollerImp extends Logincontroller{
  Myservices myservices=Get.find();
  late TextEditingController email;
  late TextEditingController Password;
  LoginData loginData=LoginData(Get.find());
  Statusrequest? statusrequest=Statusrequest.none;
  GlobalKey<FormState> formstate1=GlobalKey<FormState>();
  bool isShowPassword=true;
  showPassword(){
    isShowPassword=isShowPassword==false?true:false;
    update();
  }
  @override
  login() async{
    var formdata=formstate1.currentState;
    if(formdata != null){
        if(formdata.validate()){
          statusrequest=Statusrequest.loading;
          update();
          var response=await loginData.postdata(email.text, Password.text) ;
          statusrequest=handlingData(response);
          print(statusrequest.toString());
          if(statusrequest==Statusrequest.success){
            if(response['status']=="success"){
              if(response['data']['users_approve']==1){
                myservices.sharedpref.setString("username", response['data']['users_name']);
                myservices.sharedpref.setString("email", response['data']['users_email']);
                myservices.sharedpref.setString("id", response['data']['users_id'].toString());
                myservices.sharedpref.setString("phone", response['data']['users_phone']);
                myservices.sharedpref.setString("step", "2");
                Get.offNamed(AppRoute.home);
              }else{
                Get.offNamed(AppRoute.verifyCode,arguments: {
                  "email" :response['data']['users_email']
                });
              }
            }else{
              Get.defaultDialog(
                title: "Error",
                middleText: "Failed to login",
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
  goToSignup() {
    Get.offNamed(AppRoute.Signup);
  }
  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
      print("=====$value");
      String? token=value;
    });
    email=TextEditingController();
    Password=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    Password.dispose();
    super.dispose();
  }
  
  @override
  GoToForgetPassword() {
    Get.toNamed(AppRoute.forgetpassword);
  }
}