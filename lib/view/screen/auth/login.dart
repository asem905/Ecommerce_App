import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/auth/logincontroller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/alertexit.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/logoauth.dart';
import 'package:ecommerce/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp controller=Get.put(LogincontrollerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("9".tr,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body: PopScope(canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        // Show the exit confirmation dialog
        await alertExitApp();
        
      },child:Form(
        key: controller.formstate1,
        child:GetBuilder<LogincontrollerImp>(builder: (controller){
        return HandlinDataRequest(statusrequest: controller.statusrequest!, widget: Container(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      child: ListView(
        children: [
          Logoauth(),
          Customtextauth(text: "10".tr,),
          const SizedBox(height: 10,),
          CustomTextBodyAuth(text: "11".tr,),
          const SizedBox(height: 15,),
          Customtextformauth(hinttext: "12".tr,
          LabelText: "18".tr,
          icondata: Icons.email_outlined,
          mycontroller: controller.email,
          validator: (val) {
            return ValidInput(val!, 5, 100, "18".tr);
          },isNumber: false,
          ),

          GetBuilder<LogincontrollerImp>(builder: (controller){
            return Customtextformauth(hinttext: "13".tr,
            LabelText: "19".tr,
            icondata: Icons.lock_outline,
            mycontroller:controller.Password ,
            validator: (val) {
              return ValidInput(val!, 5, 20, "19".tr);
            },isNumber: false,
            obscureText: controller.isShowPassword,
            onTapIcon: () {
              controller.showPassword();
            },
            );
          }),
          InkWell(
            onTap: controller.GoToForgetPassword,
            child: Text("14".tr,textAlign: TextAlign.end,),
          ),
          Custombuttonauth(text: "15".tr,onPressed: () {
            controller.login();
          },),
          Container(height: 30,),
          CustomTextSignupOrIn(textone: "16".tr,texttwo: "17".tr,onTap: controller.goToSignup),
        ],
      ),
      )); 
      })
      ))
    );
  }
}