import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("32".tr,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body: Container(padding:const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.check_circle_outline,size: 200,color: AppColor.primaryColor,),),
          Text("36".tr,style: TextStyle(fontSize: 40),),
          Spacer(),
          Container(width: double.infinity,
          child: Custombuttonauth(text: "31".tr,onPressed: () {
            
          },),
          
          ),
          SizedBox(height: 30,),
          ],
      ),
      ),
    );
  }
}