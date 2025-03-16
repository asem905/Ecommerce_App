import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/auth/checkemailcontroller.dart';
import 'package:ecommerce/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckemailcontrollerImp controller=Get.put(CheckemailcontrollerImp());
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("27".tr,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body:Form(
        key: controller.formstate5,
        child: 
              Container(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      child: ListView(
        children: [
          Customtextauth(text: "28".tr,),
          const SizedBox(height: 10,),
          CustomTextBodyAuth(text: "29".tr,),
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
      )), 
    );
  }
}