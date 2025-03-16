import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/localization/changelocale.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/view/widget/language/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,style: Theme.of(context).textTheme.headlineMedium,),
            Container(height: 20,),
            Custombuttonlang(textButton: "Arabic",onPressed: () {
              controller.changeLang("ar");
              Get.toNamed(AppRoute.onBoarding);
            } ),
            Custombuttonlang(textButton: "English",onPressed: () {controller.changeLang("en");Get.toNamed(AppRoute.onBoarding);} ),
          ],
        ),
      ),
    );
  }
}