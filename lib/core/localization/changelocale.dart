import 'package:ecommerce/constants/apptheme.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LocalController extends GetxController{
  Locale? language;
  Myservices myservices=Get.find();
  ThemeData apptheme=themeEnglish;
  changeLang(String langcode){
    Locale locale=Locale(langcode);
    myservices.sharedpref!.setString("lang", langcode);
    apptheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    if(myservices.sharedpref!.getString("lang")=="ar"){
      language=Locale("ar");
      apptheme=themeArabic;
    }else if(myservices.sharedpref!.getString("lang")=="en"){
      language=Locale("en");
      apptheme=themeEnglish;
    }else{
      apptheme=themeEnglish;
      language=Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}