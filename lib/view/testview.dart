import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class Testview extends StatelessWidget {
  const Testview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: Text("View Data"),backgroundColor: AppColor.primaryColor,),
      body: GetBuilder<TestController>(builder: (controller){
        return Handlindataview(statusrequest: controller.statusrequest, widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context,index){
              return Text("${controller.data}");
          }));
        
      }),
    );
  }
}