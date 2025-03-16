import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:get/get.dart';
class CustomDotControllerOnBoarding extends GetView<Onboardingcontrollerimp> {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onboardingcontrollerimp>(
      builder: (controller) {
      return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(onBoardingList.length, (index) {
          return AnimatedContainer(duration: Duration(seconds: 2),
            width: controller.currentPage==index?20:5,
            height: 6,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
        },)

      ],
    );
    });
  }
}

