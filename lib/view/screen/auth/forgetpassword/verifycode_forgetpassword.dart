import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/auth/verifycodecontroller_signup.dart';
import 'package:ecommerce/controller/forgetpassword/verifycodeforget_controller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/verifycodeforgetpassword.dart';
import 'package:ecommerce/view/widget/auth/customtextauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
class VerifyCodeForgetPassword extends StatelessWidget {
  const VerifyCodeForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    verifycodecontrollerforgetpasswordimp controller=Get.put(verifycodecontrollerforgetpasswordimp());
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("41".tr,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body: GetBuilder<verifycodecontrollerforgetpasswordimp>(builder: (controller){
        return HandlinDataRequest(statusrequest: controller.statusrequest!, widget: Container(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      child: ListView(
        children: [
          const SizedBox(height: 250,),
          Customtextauth(text: "42".tr,),
          const SizedBox(height: 10,),
          OtpTextField(
            borderWidth: 50,
            borderRadius: BorderRadius.circular(40),
            margin: EdgeInsets.all(10),
            numberOfFields: 5,
            borderColor: Colors.red,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true, 
            //runs when a code is typed in
            onCodeChanged: (String code) {
                //handle validation or checks here           
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
                controller.goToResetPassword(verificationCode);
            }, // end onSubmit
        ),
         
          
          
          
        ],
      ),
      ));
      })
    );
  }
}