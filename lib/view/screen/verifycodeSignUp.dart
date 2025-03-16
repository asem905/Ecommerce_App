import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/constants/space.dart';
import 'package:ecommerce/controller/auth/verifycodecontroller_signup.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/view/widget/auth/customtextauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller=Get.put(VerifyCodeControllerImp());
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("41".tr,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(builder: (controller){
        return (controller.statusrequest==Statusrequest.loading)? Center(child: CircularProgressIndicator())  
        : Container(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      child: ListView(
        children: [
          const SizedBox(height: 250,),
          Customtextauth(text: "Please Enter Digit Code Sent TO ${controller.email}".tr,),
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
                controller.GoToSuccessSignUp(verificationCode);
            }, // end onSubmit
        ),
        Space(space_val: 10),
        InkWell(
          onTap: () {
            controller.resendCode();
          },
          child: Center(
            child: Text("Resend Code".tr,style: TextStyle(color: AppColor.primaryColor,fontSize: 20),),
          ),
        )
         
          
          
          
        ],
      ),
      );
      })
    );
  }
}