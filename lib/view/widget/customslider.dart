import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomSliderOnBoarding extends GetView<Onboardingcontrollerimp>{
  const CustomSliderOnBoarding({super.key});
  
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
          itemCount: onBoardingList.length,
          itemBuilder: (context,i){
          return Column(
            
            children: [
              SizedBox(height: 50,),
              Text(onBoardingList[i].title!,style: TextStyle(height: 2,fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,)),
              SizedBox(height: 60,),
              Image.asset(onBoardingList[i].image!,width: 200,height: 250,),
              SizedBox(height: 40,),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(onBoardingList[i].body!,textAlign: TextAlign.center,
                style: TextStyle(height: 2,fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,)),
              )
            ],
          );

        });
  }
}