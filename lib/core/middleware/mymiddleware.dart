import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Mymiddleware extends GetMiddleware{
  @override
  int?get priority => 0;
  Myservices myservices=Get.find();
  @override
  RouteSettings? redirect(String? route){
    if(myservices.sharedpref!.getString("step")=="2"){
      return const RouteSettings(name: AppRoute.home);
    }
    if(myservices.sharedpref!.getString("step")=="1"){
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}