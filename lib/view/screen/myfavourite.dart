import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/constants/space.dart';
import 'package:ecommerce/controller/myfavourite_controller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/data/datasource/remote/myfavourite_pagedata.dart';
import 'package:ecommerce/view/widget/custom_appbar.dart';
import 'package:ecommerce/view/widget/myfavourite/customlistfavouriteitems.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class MyFavourite extends StatelessWidget {
  const MyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavouritePageController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<MyFavouritePageController>(builder: (controller){
          return ListView(
            
          children: [
            // CustomAppbar(titleappbar: "Find Products",  onPressedsearch: () {  }, onPressedIconfav: () { 
            //         Get.toNamed(AppRoute.myfavourite);
            // },),
            Space(space_val: 10),
            Handlindataview(statusrequest: controller.statusrequest, widget: GridView.builder(
              shrinkWrap: true,
              
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.5),
              itemBuilder: (context, index) => Customlistfavouriteitems(itemsFavModel: controller.data[index]),))
          ],
        );
        })
      ),
    );
  }
}