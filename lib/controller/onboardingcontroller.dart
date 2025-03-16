
// ignore: depend_on_referenced_packages
import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class Onboardingcontroller extends GetxController{
  next();
  onPageChanged(int index);

}
class Onboardingcontrollerimp extends Onboardingcontroller{
  int currentPage=0;
  late PageController pagecontroller;
  Myservices myservices=Get.find();
  @override
  next() {
    currentPage++;
    if(currentPage > onBoardingList.length-1){
      myservices.sharedpref.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
      
    }else{
      pagecontroller.animateToPage(currentPage , duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
    
  }
  @override
  onPageChanged(int index) {
    currentPage=index;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    pagecontroller=PageController();
    super.onInit();
  }

}