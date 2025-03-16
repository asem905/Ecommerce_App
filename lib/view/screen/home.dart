import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/custom_appbar.dart';
import 'package:ecommerce/view/widget/home/customcardhome.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:ecommerce/view/widget/home/listitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageControllerImp());
    return GetBuilder<HomepageControllerImp>(
        builder: (controller) {
          return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  CustomAppbar(titleappbar: "Find Products", onPressedsearch: () { controller.onsearch(); }, onPressedIconfav: () { 
                    Get.toNamed(AppRoute.myfavourite);
                   }, onChanged: (String val) {controller.checkSearch(val);  },
                    mycontroller: controller.searchcont!,),
                  Handlindataview(
                    statusrequest: controller.statusrequest,
                    widget: controller.issearch? ListItemsSearch(listData: controller.listDataSearch):Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Customcardhome(title: "Summer Discounts", body: "Discount 20% ",),
                      Customtitlehome(title: "Categories ",),
                      Listcategorieshome(),
                      Customtitlehome(title: "Products For You",),
                      ListItemsHome( ),
                      Customtitlehome(title: "Recommended",),
                      ListItemsHome( ),
                    ],
                  )
                  )
                ],
              ),
            
          );
        }
      );

  }
}
class ListItemsSearch extends GetView<HomepageControllerImp> {
  final List<ItemsModel> listData;
  const ListItemsSearch({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context,index){
        return InkWell(
          onTap: () {
            controller.goToPageProductdetails(listData[index]);
          },
          child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
            children: [
              Expanded(child: CachedNetworkImage(imageUrl: "${AppLink.imageitems}/${listData[index].itemImage}",height: 80,)),
              Expanded(flex: 2,child: ListTile(
                title: Text("${translateDataBase(listData[index].itemName,listData[index].itemNameAr)}",style: TextStyle(fontSize: 15),),
                subtitle: Text("${listData[index].itemPrice}\$",style: TextStyle(color: AppColor.primaryColor,fontSize: 17),),
              ))
            ]
          ),
          )
        ),
        ),
        );
      },);
  }
}
