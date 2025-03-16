import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/widget/custom_appbar.dart';
import 'package:ecommerce/view/widget/items/customlistitems.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemscontrollerImp controller=Get.put(ItemscontrollerImp());
    FavouriteController controllerfav=Get.put(FavouriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<ItemscontrollerImp>(builder: (controller){
          return ListView(
          children: [
            CustomAppbar(titleappbar: "Find Products", onPressedsearch: () { controller.onsearch(); }, onPressedIconfav: () { 
                    Get.toNamed(AppRoute.myfavourite);
                   }, onChanged: (String val) {controller.checkSearch(val);  },
                    mycontroller: controller.searchcont!,),
            SizedBox(height: 10),
            Listcategoriesitems(),
            GetBuilder<ItemscontrollerImp>(builder: (controller)=> Handlindataview(statusrequest: controller.statusrequest, 
            widget: controller.issearch? ListItemsSearch(listData: controller.listDataSearch):GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.5,
                    crossAxisCount: 2)
            , itemBuilder: (BuildContext context,index){
              controllerfav.isFavourites[controller.items[index]['item_id'].toString()]=controller.items[index]['favourite'];
            return Customlistitems(itemsModel: ItemsModel.fromJson(controller.items[index]),);
            })
            )
            )
          ],
        );
        })
      )
    );
  }
}