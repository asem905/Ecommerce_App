import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';
translateDataBase(column_en,column_ar){
  Myservices myservices=Get.find();
  if(myservices.sharedpref.getString("lang")=="ar"){
    return column_ar;
  }else{
    return column_en;
  }
}