import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:ecommerce/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller=Get.put(ResetPasswordControllerImp());
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("40".tr,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body: Form(
        key: controller.formstate4,
        child: GetBuilder<ResetPasswordControllerImp>(builder: (controller){
          return HandlinDataRequest(statusrequest: controller.statusrequest!, widget: Container(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      child: ListView(
        children: [
          Customtextauth(text: "35".tr,),
          const SizedBox(height: 10,),
          CustomTextBodyAuth(text: "34".tr,),
          const SizedBox(height: 15,),
          Customtextformauth(hinttext: "13".tr,
          LabelText: "19".tr,
          icondata: Icons.lock_outline,
         mycontroller:controller.password ,
         validator: (val) {
            return ValidInput(val!, 5, 20, "19".tr);
          },isNumber: false,
          ),
         Customtextformauth(hinttext: "39".tr,
          LabelText: "35".tr,
          icondata: Icons.lock_outline,
         mycontroller:controller.rePassword ,
         validator: (val) {
            return ValidInput(val!, 5, 100, "19".tr);
          },isNumber: false,
          ),
          
          Custombuttonauth(text: "33".tr,onPressed: controller.GoToSuccessResetPassword,),  
        ],
      ),
      ));
        }), )
    );
  }
}