import 'package:ecommerce/core/localization/changelocale.dart';
import 'package:ecommerce/core/localization/translations.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/mybindings.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller= Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslations(),
      locale:controller.language,
      debugShowCheckedModeBanner: false,
      theme: controller.apptheme,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}
