import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/controller/homescreencontroller.dart';
import 'package:ecommerce/view/widget/home/custombuttonappbar.dart';
import 'package:ecommerce/view/widget/home/custombuttonnavbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreencontrollerImp());
    return GetBuilder<HomescreencontrollerImp>(builder: (controller)=>Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: (){Get.toNamed(AppRoute.cart);},
              child: Icon(Icons.shopping_basket_outlined),),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustombuttonNavbar(),
      body: controller.listpage.elementAt(controller.currentIndex),
    ));
  }
}