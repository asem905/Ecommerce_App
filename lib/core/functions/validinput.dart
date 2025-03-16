// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
ValidInput(String val,int min,int max,String type){
  if(val.isEmpty){
    return "Empty fields";
  }
  if(type=="18".tr){
    if(!GetUtils.isEmail(val)){
      return "Invalid Email";
    }
  }
  if(type=="21".tr){
    if(!GetUtils.isPhoneNumber(val)){
      return "Invalid Phone Number";
    }
  }
  if(type=="20".tr){
    if(!GetUtils.isUsername(val)){
      return "Invalid username";
    }
  }
  if(val.isEmpty){
    return "Empty fields";
  }
  if(val.length<min){
    return "can't be smaller than $min";
  }
  if(val.length>max){
    return "can't be greater than $max";
  }


}