
import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/view/widget/custombutton.dart';
import 'package:ecommerce/view/widget/customslider.dart';
import 'package:ecommerce/view/widget/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onboardingcontrollerimp());
    return Scaffold(
      body:Column(
        children: [
          Expanded(
            flex: 3,
            child:CustomSliderOnBoarding()),
        Expanded(
          child: Column(
            children: [
              CustomDotControllerOnBoarding(),
              Spacer(flex:2),
              CustomButtonOnBoarding(),
            ],
          ))
        ],
      )
    );
  }
}