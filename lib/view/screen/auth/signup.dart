import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/auth/signupcontroller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/logoauth.dart';
import 'package:ecommerce/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignUp extends StatelessWidget {
  const SignUp({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("17".tr,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body:GetBuilder<SignUpcontrollerImp>(builder: (controller){
        return HandlinDataRequest(statusrequest: controller.statusrequest!, widget: Form(
        key: controller.formstate2,
        child: Container(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      child: ListView(
        
        children: [
          Customtextauth(text: "10".tr,),
          const SizedBox(height: 10,),
          CustomTextBodyAuth(text: "11".tr,),
          const SizedBox(height: 15,),
          Customtextformauth(hinttext: "23".tr,
          LabelText: "20".tr,
          icondata: Icons.person_outline,
         mycontroller: controller.username,
         validator: (val) {
            return ValidInput(val!, 5, 40, "20".tr);
          }, isNumber: false,
          ),
          
          Customtextformauth(hinttext: "12".tr,
          LabelText: "18".tr,
          icondata: Icons.email_outlined,
          mycontroller: controller.email,
          validator: (val) {
            return ValidInput(val!, 5, 100, "18".tr);
          }, isNumber: false,
          ),
          Customtextformauth(hinttext: "22".tr,
          LabelText: "21".tr,
          icondata: Icons.phone_android_outlined,
         mycontroller:controller.phone ,
         validator: (val) {
            return ValidInput(val!, 5, 100, "21".tr);
          }, isNumber: true,
          ),
          Customtextformauth(hinttext: "13".tr,
          obscureText: controller.isShowPassword,
            onTapIcon: () {
              controller.showPassword();
            },
          LabelText: "19".tr,
          icondata: Icons.lock_outline,
         mycontroller:controller.Password ,
         validator: (val) {
            return ValidInput(val!, 5, 100, "19".tr);
          }, isNumber: false,
          ),
          Custombuttonauth(text: "17".tr,onPressed: () {
            controller.SignUp();
          },),
          Container(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          CustomTextSignupOrIn(textone: "25".tr,texttwo: "26".tr,onTap: controller.GoToLogin),
            ],
          )
        ],
      ),
      )));}
      )
    );
  }
}