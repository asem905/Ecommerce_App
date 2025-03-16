import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Success",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.grey),),
      ),
      body: Container(padding:const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.check_circle_outline,size: 200,color: AppColor.primaryColor,),),
          Text("Well Done",style: TextStyle(fontSize: 40),),
          Text("You are now a user",style: TextStyle(fontSize: 40),),
          Spacer(),
          Container(width: double.infinity,
          child: Custombuttonauth(text: "Go To Login",onPressed: () {
            Get.offAllNamed(AppRoute.login);
          },),
          
          ),
          SizedBox(height: 30,),
          ],
      ),
      ),
    );
  }
}