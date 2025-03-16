import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomButtonOnBoarding extends GetView<Onboardingcontrollerimp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(bottom: 70),
      child: MaterialButton(onPressed: (){
        controller.next();
      },
      color: Colors.blue,
      textColor: Colors.black,
      child: Text("Continue"),
      ),
    );
  }
}