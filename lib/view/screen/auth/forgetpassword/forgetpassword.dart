import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordcontrollerImp controller=Get.put(ForgetPasswordcontrollerImp());
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("14".tr,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body: Form(
        key: controller.formstate3,
        child: GetBuilder<ForgetPasswordcontrollerImp>(builder: (controller){
          return (HandlinDataRequest(statusrequest: controller.statusrequest!,widget: Container(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      child: ListView(
        children: [
          Customtextauth(text: "12".tr,),
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
         
          
          Custombuttonauth(text: "30".tr,onPressed: () {
            controller.CheckEmail();
          },),
          
        ],
      ),
      ),));
        }),) 
    );
  }
}